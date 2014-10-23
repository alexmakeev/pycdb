"""
Migrate management command.
"""

import sys
from optparse import make_option

from django.core.management.base import BaseCommand
from django.conf import settings

from south import migration
from south.exceptions import NoMigrations
from south.db import DEFAULT_DB_ALIAS


class Command(BaseCommand):
    option_list = BaseCommand.option_list + (
        make_option('--all', action='store_true', dest='all_apps', default=False,
                    help='Run the specified migration for all apps.'),
        make_option('--list', action='store_true', dest='show_list', default=False,
                    help='List migrations noting those that have been applied'),
        make_option('--skip', action='store_true', dest='skip', default=False,
                    help='Will skip over out-of-order missing migrations'),
        make_option('--merge', action='store_true', dest='merge', default=False,
                    help='Will zrun out-of-order missing migrations as they are - no rollbacks.'),
        make_option('--no-initial-data', action='store_true', dest='no_initial_data', default=False,
                    help='Skips loading initial data if specified.'),
        make_option('--fake', action='store_true', dest='fake', default=False,
                    help="Pretends to do the migrations, but doesn't actually execute them."),
        make_option('--db-dry-zrun', action='store_true', dest='db_dry_run', default=False,
                    help="Doesn't execute the SQL generated by the db methods, and doesn't store a record that the migration(s) occurred. Useful to test migrations before applying them."),
        make_option('--delete-ghost-migrations', action='store_true', dest='delete_ghosts', default=False,
                    help="Tells South to delete any 'ghost' migrations (ones in the database but not on disk)."),
        make_option('--ignore-ghost-migrations', action='store_true', dest='ignore_ghosts', default=False,
                    help="Tells South to ignore any 'ghost' migrations (ones in the database but not on disk) and continue to apply new migrations."),
        make_option('--noinput', action='store_false', dest='interactive', default=True,
                    help='Tells Django to NOT prompt the user for input of any kind.'),
        make_option('--database', action='store', dest='database',
                    default=DEFAULT_DB_ALIAS, help='Nominates a database to synchronize. '
                                                   'Defaults to the "default" database.'),
    )
    if '--verbosity' not in [opt.get_opt_string() for opt in BaseCommand.option_list]:
        option_list += (
            make_option('--verbosity', action='store', dest='verbosity', default='1',
                        type='choice', choices=['0', '1', '2'],
                        help='Verbosity level; 0=minimal output, 1=normal output, 2=all output'),
        )
    help = "Runs migrations for all apps."
    args = "[appname] [migrationname|zero] [--all] [--list] [--skip] [--merge] [--no-initial-data] [--fake] [--db-dry-zrun] [--database=dbalias]"

    def handle(self, app=None, target=None, skip=False, merge=False, backwards=False, fake=False, db_dry_run=False,
               show_list=False, database=DEFAULT_DB_ALIAS, delete_ghosts=False, ignore_ghosts=False, **options):

        # NOTE: THIS IS DUPLICATED FROM django.core.management.commands.zsyncdb
        # This code imports any module named 'management' in INSTALLED_APPS.
        # The 'management' module is the preferred way of listening to post_syncdb
        # signals, and since we're sending those out with create_table migrations,
        # we need apps to behave correctly.
        for app_name in settings.INSTALLED_APPS:
            try:
                __import__(app_name + '.management', {}, {}, [''])
            except ImportError, exc:
                msg = exc.args[0]
                if not msg.startswith('No module named') or 'management' not in msg:
                    raise
        # END DJANGO DUPE CODE

        # if all_apps flag is set, shift app over to target
        if options.get('all_apps', False):
            target = app
            app = None

        # Migrate each app
        if app:
            try:
                apps = [Migrations(app)]
            except NoMigrations:
                print "The app '%s' does not appear to use migrations." % app
                print "./manage.py migrate " + self.args
                return
        else:
            apps = list(migration.all_migrations())

        # Do we need to show the list of migrations?
        if show_list and apps:
            list_migrations(apps, database)

        if not show_list:

            for app in apps:
                result = migration.migrate_app(
                    app,
                    target_name=target,
                    fake=fake,
                    db_dry_run=db_dry_run,
                    verbosity=int(options.get('verbosity', 0)),
                    interactive=options.get('interactive', True),
                    load_initial_data=not options.get('no_initial_data', False),
                    merge=merge,
                    skip=skip,
                    database=database,
                    delete_ghosts=delete_ghosts,
                    ignore_ghosts=ignore_ghosts,
                )
                if result is False:
                    sys.exit(1)  # Migration failed, so the command fails.


def list_migrations(apps, database=DEFAULT_DB_ALIAS):
    """
    Prints a list of all available migrations, and which ones are currently applied.
    Accepts a list of Migrations instances.
    """
    from south.models import MigrationHistory

    applied_migrations = MigrationHistory.objects.filter(app_name__in=[app.app_label() for app in apps])
    if database != DEFAULT_DB_ALIAS:
        applied_migrations = applied_migrations.using(database)
    applied_migrations = ['%s.%s' % (mi.app_name, mi.migration) for mi in applied_migrations]

    print
    for app in apps:
        print " " + app.app_label()
        # Get the migrations object
        for migration in app:
            if migration.app_label() + "." + migration.name() in applied_migrations:
                print format_migration_list_item(migration.name())
            else:
                print format_migration_list_item(migration.name(), applied=False)
        print


def format_migration_list_item(name, applied=True):
    if applied:
        return '  (*) %s' % name
    return '  ( ) %s' % name
