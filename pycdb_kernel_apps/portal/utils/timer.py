import datetime

class Timer:
    def __init__(self):
        self.start_time = datetime.datetime.now()
        self.flags_starts = {}
        self.flags_ends = {}

    def start(self, flag_name):
        self.flags_starts[flag_name] = datetime.datetime.now() - self.start_time

    def end(self, flag_name):
        self.flags_ends[flag_name] = datetime.datetime.now() - self.start_time

    def get_info(self):
        ret_list = []
        keys = self.flags_starts.keys()
        dt = datetime.timedelta()
        def tcmp(x,y):
            #print self.flags_starts[x], self.flags_starts[y], int(self.flags_starts[x]>self.flags_starts[y])
            a = self.flags_starts[x]
            b = self.flags_starts[y]
            if (a>b): return 1
            if (b>a): return -1
            return 0
        keys.sort(cmp=tcmp)
        for key in keys:
            if key not in self.flags_ends: continue
            ret_list += ["%s: %s (%s)" % (self.flags_starts[key], key, self.flags_ends[key]-self.flags_starts[key])]
        return ret_list