#!../../bin/linux-x86/psc

< envPaths

epicsEnvSet("EPICS_CA_AUTO_ADDR_LIST","NO")
epicsEnvSet("EPICS_CA_ADDR_LIST","10.0.153.255")
epicsEnvSet("IOCNAME", "ps-br-6a-ng")

# to avoid a lot of "scanOnce: Ring buffer overflow" during save/restore initialization
scanOnceSetQueueSize(2000)

#epicsThreadSleep 5

cd ${TOP}

## Register all support components
dbLoadDatabase("dbd/psc.dbd",0,0)
psc_registerRecordDeviceDriver(pdbbase)

## Load record instances


dbLoadRecords("db/Commands.db",       "PriSys=BR, PS=PSC17")
dbLoadRecords("db/Status.db",         "PriSys=BR, PS=PSC17")
# ADC waveforms (both 10k and 1k)
dbLoadRecords("db/ADCWaveform.db",    "PSy=BR, PS=PSC17, TIMESTAMP=BST-TS{EVR:D3A}Cnt:BRPrev-I, ADC1K_POINTS=1014, ADC10K_POINTS=10150")
# adjusted ADC waveforms are below
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC17}ADC:00_Raw-I,  OUTPUT=BR{PSC17}ADC:00-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC17}ADC:01_Raw-I,  OUTPUT=BR{PSC17}ADC:01-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC17}ADC:02_Raw-I,  OUTPUT=BR{PSC17}ADC:02-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC17}ADC:03_Raw-I,  OUTPUT=BR{PSC17}ADC:03-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC17}ADC:04_Raw-I,  OUTPUT=BR{PSC17}ADC:04-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC17}ADC:05_Raw-I,  OUTPUT=BR{PSC17}ADC:05-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC17}ADC:06_Raw-I,  OUTPUT=BR{PSC17}ADC:06-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC17}ADC:07_Raw-I,  OUTPUT=BR{PSC17}ADC:07-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC17}ADC:08_Raw-I,  OUTPUT=BR{PSC17}ADC:08-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC17}ADC:09_Raw-I,  OUTPUT=BR{PSC17}ADC:09-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC17}ADC:10_Raw-I,  OUTPUT=BR{PSC17}ADC:10-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC17}ADC:11_Raw-I,  OUTPUT=BR{PSC17}ADC:11-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC17}ADC:12_Raw-I,  OUTPUT=BR{PSC17}ADC:12-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC17}ADC:13_Raw-I,  OUTPUT=BR{PSC17}ADC:13-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC17}ADC:14_Raw-I,  OUTPUT=BR{PSC17}ADC:14-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC17}ADC:15_Raw-I,  OUTPUT=BR{PSC17}ADC:15-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC17}ADC:16_Raw-I,  OUTPUT=BR{PSC17}ADC:16-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC17}ADC:17_Raw-I,  OUTPUT=BR{PSC17}ADC:17-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR{PSC17}ADC10k:0_Raw-I,  OUTPUT=BR{PSC17}ADC10k:0_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Average.db",        "INPUT=BR{PSC17}ADC10k:1_Raw-I,  OUTPUT=BR{PSC17}ADC10k:1_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Subtract.db",       "INPUT1=BR{PSC17}ADC10k:0_Raw-I, INPUT2=BR{PSC17}ADC10k:1_Raw-I, OUTPUT=BR{PSC17}ADC10k_Sub-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC17}ADC10k:0_Raw-I,  OUTPUT=BR{PSC17}ADC10k:0_Raw_I_FFT-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC17}ADC10k:1_Raw-I,  OUTPUT=BR{PSC17}ADC10k:1_Raw_I_FFT-I, WF_LENGTH=10150")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC17, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=0, MSGID=81, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC17}DAC:0-SP,         OUTPUT=BR{PSC17}DAC:0_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC17}DAC:0_Raw-SP,     OUTPUT=BR{PSC17}DAC:0_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC17}DAC:0_Raw_tr-SP,  OUTPUT=BR{PSC17}DAC:0_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC17, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=1, MSGID=82, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC17}DAC:1-SP,         OUTPUT=BR{PSC17}DAC:1_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC17}DAC:1_Raw-SP,     OUTPUT=BR{PSC17}DAC:1_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC17}DAC:1_Raw_tr-SP,  OUTPUT=BR{PSC17}DAC:1_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Commands.db",       "PriSys=BR, PS=PSC18")
dbLoadRecords("db/Status.db",         "PriSys=BR, PS=PSC18")
# ADC waveforms (both 10k and 1k)
dbLoadRecords("db/ADCWaveform.db",    "PSy=BR, PS=PSC18, TIMESTAMP=BST-TS{EVR:D3A}Cnt:BRPrev-I, ADC1K_POINTS=1014, ADC10K_POINTS=10150")
# adjusted ADC waveforms are below
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC18}ADC:00_Raw-I,  OUTPUT=BR{PSC18}ADC:00-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC18}ADC:01_Raw-I,  OUTPUT=BR{PSC18}ADC:01-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC18}ADC:02_Raw-I,  OUTPUT=BR{PSC18}ADC:02-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC18}ADC:03_Raw-I,  OUTPUT=BR{PSC18}ADC:03-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC18}ADC:04_Raw-I,  OUTPUT=BR{PSC18}ADC:04-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC18}ADC:05_Raw-I,  OUTPUT=BR{PSC18}ADC:05-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC18}ADC:06_Raw-I,  OUTPUT=BR{PSC18}ADC:06-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC18}ADC:07_Raw-I,  OUTPUT=BR{PSC18}ADC:07-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC18}ADC:08_Raw-I,  OUTPUT=BR{PSC18}ADC:08-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC18}ADC:09_Raw-I,  OUTPUT=BR{PSC18}ADC:09-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC18}ADC:10_Raw-I,  OUTPUT=BR{PSC18}ADC:10-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC18}ADC:11_Raw-I,  OUTPUT=BR{PSC18}ADC:11-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC18}ADC:12_Raw-I,  OUTPUT=BR{PSC18}ADC:12-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC18}ADC:13_Raw-I,  OUTPUT=BR{PSC18}ADC:13-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC18}ADC:14_Raw-I,  OUTPUT=BR{PSC18}ADC:14-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC18}ADC:15_Raw-I,  OUTPUT=BR{PSC18}ADC:15-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC18}ADC:16_Raw-I,  OUTPUT=BR{PSC18}ADC:16-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC18}ADC:17_Raw-I,  OUTPUT=BR{PSC18}ADC:17-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR{PSC18}ADC10k:0_Raw-I,  OUTPUT=BR{PSC18}ADC10k:0_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Average.db",        "INPUT=BR{PSC18}ADC10k:1_Raw-I,  OUTPUT=BR{PSC18}ADC10k:1_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Subtract.db",       "INPUT1=BR{PSC18}ADC10k:0_Raw-I, INPUT2=BR{PSC18}ADC10k:1_Raw-I, OUTPUT=BR{PSC18}ADC10k_Sub-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC18}ADC10k:0_Raw-I,  OUTPUT=BR{PSC18}ADC10k:0_Raw_I_FFT-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC18}ADC10k:1_Raw-I,  OUTPUT=BR{PSC18}ADC10k:1_Raw_I_FFT-I, WF_LENGTH=10150")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC18, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=0, MSGID=81, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC18}DAC:0-SP,         OUTPUT=BR{PSC18}DAC:0_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC18}DAC:0_Raw-SP,     OUTPUT=BR{PSC18}DAC:0_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC18}DAC:0_Raw_tr-SP,  OUTPUT=BR{PSC18}DAC:0_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC18, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=1, MSGID=82, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC18}DAC:1-SP,         OUTPUT=BR{PSC18}DAC:1_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC18}DAC:1_Raw-SP,     OUTPUT=BR{PSC18}DAC:1_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC18}DAC:1_Raw_tr-SP,  OUTPUT=BR{PSC18}DAC:1_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Commands.db",       "PriSys=BR, PS=PSC19")
dbLoadRecords("db/Status.db",         "PriSys=BR, PS=PSC19")
# ADC waveforms (both 10k and 1k)
dbLoadRecords("db/ADCWaveform.db",    "PSy=BR, PS=PSC19, TIMESTAMP=BST-TS{EVR:D3A}Cnt:BRPrev-I, ADC1K_POINTS=1014, ADC10K_POINTS=10150")
# adjusted ADC waveforms are below
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC19}ADC:00_Raw-I,  OUTPUT=BR{PSC19}ADC:00-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC19}ADC:01_Raw-I,  OUTPUT=BR{PSC19}ADC:01-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC19}ADC:02_Raw-I,  OUTPUT=BR{PSC19}ADC:02-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC19}ADC:03_Raw-I,  OUTPUT=BR{PSC19}ADC:03-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC19}ADC:04_Raw-I,  OUTPUT=BR{PSC19}ADC:04-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC19}ADC:05_Raw-I,  OUTPUT=BR{PSC19}ADC:05-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC19}ADC:06_Raw-I,  OUTPUT=BR{PSC19}ADC:06-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC19}ADC:07_Raw-I,  OUTPUT=BR{PSC19}ADC:07-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC19}ADC:08_Raw-I,  OUTPUT=BR{PSC19}ADC:08-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC19}ADC:09_Raw-I,  OUTPUT=BR{PSC19}ADC:09-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC19}ADC:10_Raw-I,  OUTPUT=BR{PSC19}ADC:10-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC19}ADC:11_Raw-I,  OUTPUT=BR{PSC19}ADC:11-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC19}ADC:12_Raw-I,  OUTPUT=BR{PSC19}ADC:12-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC19}ADC:13_Raw-I,  OUTPUT=BR{PSC19}ADC:13-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC19}ADC:14_Raw-I,  OUTPUT=BR{PSC19}ADC:14-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC19}ADC:15_Raw-I,  OUTPUT=BR{PSC19}ADC:15-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC19}ADC:16_Raw-I,  OUTPUT=BR{PSC19}ADC:16-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC19}ADC:17_Raw-I,  OUTPUT=BR{PSC19}ADC:17-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR{PSC19}ADC10k:0_Raw-I,  OUTPUT=BR{PSC19}ADC10k:0_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Average.db",        "INPUT=BR{PSC19}ADC10k:1_Raw-I,  OUTPUT=BR{PSC19}ADC10k:1_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Subtract.db",       "INPUT1=BR{PSC19}ADC10k:0_Raw-I, INPUT2=BR{PSC19}ADC10k:1_Raw-I, OUTPUT=BR{PSC19}ADC10k_Sub-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC19}ADC10k:0_Raw-I,  OUTPUT=BR{PSC19}ADC10k:0_Raw_I_FFT-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC19}ADC10k:1_Raw-I,  OUTPUT=BR{PSC19}ADC10k:1_Raw_I_FFT-I, WF_LENGTH=10150")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC19, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=0, MSGID=81, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC19}DAC:0-SP,         OUTPUT=BR{PSC19}DAC:0_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC19}DAC:0_Raw-SP,     OUTPUT=BR{PSC19}DAC:0_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC19}DAC:0_Raw_tr-SP,  OUTPUT=BR{PSC19}DAC:0_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC19, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=1, MSGID=82, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC19}DAC:1-SP,         OUTPUT=BR{PSC19}DAC:1_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC19}DAC:1_Raw-SP,     OUTPUT=BR{PSC19}DAC:1_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC19}DAC:1_Raw_tr-SP,  OUTPUT=BR{PSC19}DAC:1_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Commands.db",       "PriSys=BR, PS=PSC20")
dbLoadRecords("db/Status.db",         "PriSys=BR, PS=PSC20")
# ADC waveforms (both 10k and 1k)
dbLoadRecords("db/ADCWaveform.db",    "PSy=BR, PS=PSC20, TIMESTAMP=BST-TS{EVR:D3A}Cnt:BRPrev-I, ADC1K_POINTS=1014, ADC10K_POINTS=10150")
# adjusted ADC waveforms are below
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC20}ADC:00_Raw-I,  OUTPUT=BR{PSC20}ADC:00-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC20}ADC:01_Raw-I,  OUTPUT=BR{PSC20}ADC:01-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC20}ADC:02_Raw-I,  OUTPUT=BR{PSC20}ADC:02-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC20}ADC:03_Raw-I,  OUTPUT=BR{PSC20}ADC:03-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC20}ADC:04_Raw-I,  OUTPUT=BR{PSC20}ADC:04-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC20}ADC:05_Raw-I,  OUTPUT=BR{PSC20}ADC:05-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC20}ADC:06_Raw-I,  OUTPUT=BR{PSC20}ADC:06-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC20}ADC:07_Raw-I,  OUTPUT=BR{PSC20}ADC:07-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC20}ADC:08_Raw-I,  OUTPUT=BR{PSC20}ADC:08-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC20}ADC:09_Raw-I,  OUTPUT=BR{PSC20}ADC:09-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC20}ADC:10_Raw-I,  OUTPUT=BR{PSC20}ADC:10-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC20}ADC:11_Raw-I,  OUTPUT=BR{PSC20}ADC:11-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC20}ADC:12_Raw-I,  OUTPUT=BR{PSC20}ADC:12-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC20}ADC:13_Raw-I,  OUTPUT=BR{PSC20}ADC:13-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC20}ADC:14_Raw-I,  OUTPUT=BR{PSC20}ADC:14-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC20}ADC:15_Raw-I,  OUTPUT=BR{PSC20}ADC:15-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC20}ADC:16_Raw-I,  OUTPUT=BR{PSC20}ADC:16-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC20}ADC:17_Raw-I,  OUTPUT=BR{PSC20}ADC:17-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR{PSC20}ADC10k:0_Raw-I,  OUTPUT=BR{PSC20}ADC10k:0_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Average.db",        "INPUT=BR{PSC20}ADC10k:1_Raw-I,  OUTPUT=BR{PSC20}ADC10k:1_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Subtract.db",       "INPUT1=BR{PSC20}ADC10k:0_Raw-I, INPUT2=BR{PSC20}ADC10k:1_Raw-I, OUTPUT=BR{PSC20}ADC10k_Sub-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC20}ADC10k:0_Raw-I,  OUTPUT=BR{PSC20}ADC10k:0_Raw_I_FFT-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC20}ADC10k:1_Raw-I,  OUTPUT=BR{PSC20}ADC10k:1_Raw_I_FFT-I, WF_LENGTH=10150")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC20, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=0, MSGID=81, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC20}DAC:0-SP,         OUTPUT=BR{PSC20}DAC:0_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC20}DAC:0_Raw-SP,     OUTPUT=BR{PSC20}DAC:0_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC20}DAC:0_Raw_tr-SP,  OUTPUT=BR{PSC20}DAC:0_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC20, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=1, MSGID=82, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC20}DAC:1-SP,         OUTPUT=BR{PSC20}DAC:1_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC20}DAC:1_Raw-SP,     OUTPUT=BR{PSC20}DAC:1_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC20}DAC:1_Raw_tr-SP,  OUTPUT=BR{PSC20}DAC:1_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Commands.db",       "PriSys=BR, PS=PSC21")
dbLoadRecords("db/Status.db",         "PriSys=BR, PS=PSC21")
# ADC waveforms (both 10k and 1k)
dbLoadRecords("db/ADCWaveform.db",    "PSy=BR, PS=PSC21, TIMESTAMP=BST-TS{EVR:D3A}Cnt:BRPrev-I, ADC1K_POINTS=1014, ADC10K_POINTS=10150")
# adjusted ADC waveforms are below
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC21}ADC:00_Raw-I,  OUTPUT=BR{PSC21}ADC:00-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC21}ADC:01_Raw-I,  OUTPUT=BR{PSC21}ADC:01-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC21}ADC:02_Raw-I,  OUTPUT=BR{PSC21}ADC:02-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC21}ADC:03_Raw-I,  OUTPUT=BR{PSC21}ADC:03-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC21}ADC:04_Raw-I,  OUTPUT=BR{PSC21}ADC:04-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC21}ADC:05_Raw-I,  OUTPUT=BR{PSC21}ADC:05-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC21}ADC:06_Raw-I,  OUTPUT=BR{PSC21}ADC:06-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC21}ADC:07_Raw-I,  OUTPUT=BR{PSC21}ADC:07-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC21}ADC:08_Raw-I,  OUTPUT=BR{PSC21}ADC:08-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC21}ADC:09_Raw-I,  OUTPUT=BR{PSC21}ADC:09-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC21}ADC:10_Raw-I,  OUTPUT=BR{PSC21}ADC:10-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC21}ADC:11_Raw-I,  OUTPUT=BR{PSC21}ADC:11-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC21}ADC:12_Raw-I,  OUTPUT=BR{PSC21}ADC:12-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC21}ADC:13_Raw-I,  OUTPUT=BR{PSC21}ADC:13-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC21}ADC:14_Raw-I,  OUTPUT=BR{PSC21}ADC:14-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC21}ADC:15_Raw-I,  OUTPUT=BR{PSC21}ADC:15-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC21}ADC:16_Raw-I,  OUTPUT=BR{PSC21}ADC:16-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC21}ADC:17_Raw-I,  OUTPUT=BR{PSC21}ADC:17-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR{PSC21}ADC10k:0_Raw-I,  OUTPUT=BR{PSC21}ADC10k:0_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Average.db",        "INPUT=BR{PSC21}ADC10k:1_Raw-I,  OUTPUT=BR{PSC21}ADC10k:1_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Subtract.db",       "INPUT1=BR{PSC21}ADC10k:0_Raw-I, INPUT2=BR{PSC21}ADC10k:1_Raw-I, OUTPUT=BR{PSC21}ADC10k_Sub-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC21}ADC10k:0_Raw-I,  OUTPUT=BR{PSC21}ADC10k:0_Raw_I_FFT-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC21}ADC10k:1_Raw-I,  OUTPUT=BR{PSC21}ADC10k:1_Raw_I_FFT-I, WF_LENGTH=10150")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC21, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=0, MSGID=81, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC21}DAC:0-SP,         OUTPUT=BR{PSC21}DAC:0_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC21}DAC:0_Raw-SP,     OUTPUT=BR{PSC21}DAC:0_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC21}DAC:0_Raw_tr-SP,  OUTPUT=BR{PSC21}DAC:0_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC21, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=1, MSGID=82, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC21}DAC:1-SP,         OUTPUT=BR{PSC21}DAC:1_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC21}DAC:1_Raw-SP,     OUTPUT=BR{PSC21}DAC:1_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC21}DAC:1_Raw_tr-SP,  OUTPUT=BR{PSC21}DAC:1_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Commands.db",       "PriSys=BR, PS=PSC22")
dbLoadRecords("db/Status.db",         "PriSys=BR, PS=PSC22")
# ADC waveforms (both 10k and 1k)
dbLoadRecords("db/ADCWaveform.db",    "PSy=BR, PS=PSC22, TIMESTAMP=BST-TS{EVR:D3A}Cnt:BRPrev-I, ADC1K_POINTS=1014, ADC10K_POINTS=10150")
# adjusted ADC waveforms are below
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC22}ADC:00_Raw-I,  OUTPUT=BR{PSC22}ADC:00-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC22}ADC:01_Raw-I,  OUTPUT=BR{PSC22}ADC:01-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC22}ADC:02_Raw-I,  OUTPUT=BR{PSC22}ADC:02-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC22}ADC:03_Raw-I,  OUTPUT=BR{PSC22}ADC:03-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC22}ADC:04_Raw-I,  OUTPUT=BR{PSC22}ADC:04-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC22}ADC:05_Raw-I,  OUTPUT=BR{PSC22}ADC:05-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC22}ADC:06_Raw-I,  OUTPUT=BR{PSC22}ADC:06-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC22}ADC:07_Raw-I,  OUTPUT=BR{PSC22}ADC:07-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC22}ADC:08_Raw-I,  OUTPUT=BR{PSC22}ADC:08-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC22}ADC:09_Raw-I,  OUTPUT=BR{PSC22}ADC:09-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC22}ADC:10_Raw-I,  OUTPUT=BR{PSC22}ADC:10-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC22}ADC:11_Raw-I,  OUTPUT=BR{PSC22}ADC:11-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC22}ADC:12_Raw-I,  OUTPUT=BR{PSC22}ADC:12-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC22}ADC:13_Raw-I,  OUTPUT=BR{PSC22}ADC:13-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC22}ADC:14_Raw-I,  OUTPUT=BR{PSC22}ADC:14-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC22}ADC:15_Raw-I,  OUTPUT=BR{PSC22}ADC:15-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC22}ADC:16_Raw-I,  OUTPUT=BR{PSC22}ADC:16-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC22}ADC:17_Raw-I,  OUTPUT=BR{PSC22}ADC:17-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR{PSC22}ADC10k:0_Raw-I,  OUTPUT=BR{PSC22}ADC10k:0_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Average.db",        "INPUT=BR{PSC22}ADC10k:1_Raw-I,  OUTPUT=BR{PSC22}ADC10k:1_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Subtract.db",       "INPUT1=BR{PSC22}ADC10k:0_Raw-I, INPUT2=BR{PSC22}ADC10k:1_Raw-I, OUTPUT=BR{PSC22}ADC10k_Sub-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC22}ADC10k:0_Raw-I,  OUTPUT=BR{PSC22}ADC10k:0_Raw_I_FFT-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC22}ADC10k:1_Raw-I,  OUTPUT=BR{PSC22}ADC10k:1_Raw_I_FFT-I, WF_LENGTH=10150")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC22, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=0, MSGID=81, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC22}DAC:0-SP,         OUTPUT=BR{PSC22}DAC:0_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC22}DAC:0_Raw-SP,     OUTPUT=BR{PSC22}DAC:0_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC22}DAC:0_Raw_tr-SP,  OUTPUT=BR{PSC22}DAC:0_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC22, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=1, MSGID=82, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC22}DAC:1-SP,         OUTPUT=BR{PSC22}DAC:1_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC22}DAC:1_Raw-SP,     OUTPUT=BR{PSC22}DAC:1_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC22}DAC:1_Raw_tr-SP,  OUTPUT=BR{PSC22}DAC:1_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Commands.db",       "PriSys=BR, PS=PSC23")
dbLoadRecords("db/Status.db",         "PriSys=BR, PS=PSC23")
# ADC waveforms (both 10k and 1k)
dbLoadRecords("db/ADCWaveform.db",    "PSy=BR, PS=PSC23, TIMESTAMP=BST-TS{EVR:D3A}Cnt:BRPrev-I, ADC1K_POINTS=1014, ADC10K_POINTS=10150")
# adjusted ADC waveforms are below
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC23}ADC:00_Raw-I,  OUTPUT=BR{PSC23}ADC:00-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC23}ADC:01_Raw-I,  OUTPUT=BR{PSC23}ADC:01-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC23}ADC:02_Raw-I,  OUTPUT=BR{PSC23}ADC:02-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC23}ADC:03_Raw-I,  OUTPUT=BR{PSC23}ADC:03-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC23}ADC:04_Raw-I,  OUTPUT=BR{PSC23}ADC:04-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC23}ADC:05_Raw-I,  OUTPUT=BR{PSC23}ADC:05-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC23}ADC:06_Raw-I,  OUTPUT=BR{PSC23}ADC:06-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC23}ADC:07_Raw-I,  OUTPUT=BR{PSC23}ADC:07-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC23}ADC:08_Raw-I,  OUTPUT=BR{PSC23}ADC:08-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC23}ADC:09_Raw-I,  OUTPUT=BR{PSC23}ADC:09-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC23}ADC:10_Raw-I,  OUTPUT=BR{PSC23}ADC:10-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC23}ADC:11_Raw-I,  OUTPUT=BR{PSC23}ADC:11-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC23}ADC:12_Raw-I,  OUTPUT=BR{PSC23}ADC:12-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC23}ADC:13_Raw-I,  OUTPUT=BR{PSC23}ADC:13-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC23}ADC:14_Raw-I,  OUTPUT=BR{PSC23}ADC:14-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC23}ADC:15_Raw-I,  OUTPUT=BR{PSC23}ADC:15-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC23}ADC:16_Raw-I,  OUTPUT=BR{PSC23}ADC:16-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC23}ADC:17_Raw-I,  OUTPUT=BR{PSC23}ADC:17-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR{PSC23}ADC10k:0_Raw-I,  OUTPUT=BR{PSC23}ADC10k:0_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Average.db",        "INPUT=BR{PSC23}ADC10k:1_Raw-I,  OUTPUT=BR{PSC23}ADC10k:1_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Subtract.db",       "INPUT1=BR{PSC23}ADC10k:0_Raw-I, INPUT2=BR{PSC23}ADC10k:1_Raw-I, OUTPUT=BR{PSC23}ADC10k_Sub-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC23}ADC10k:0_Raw-I,  OUTPUT=BR{PSC23}ADC10k:0_Raw_I_FFT-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC23}ADC10k:1_Raw-I,  OUTPUT=BR{PSC23}ADC10k:1_Raw_I_FFT-I, WF_LENGTH=10150")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC23, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=0, MSGID=81, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC23}DAC:0-SP,         OUTPUT=BR{PSC23}DAC:0_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC23}DAC:0_Raw-SP,     OUTPUT=BR{PSC23}DAC:0_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC23}DAC:0_Raw_tr-SP,  OUTPUT=BR{PSC23}DAC:0_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC23, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=1, MSGID=82, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC23}DAC:1-SP,         OUTPUT=BR{PSC23}DAC:1_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC23}DAC:1_Raw-SP,     OUTPUT=BR{PSC23}DAC:1_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC23}DAC:1_Raw_tr-SP,  OUTPUT=BR{PSC23}DAC:1_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Commands.db",       "PriSys=BR, PS=PSC24")
dbLoadRecords("db/Status.db",         "PriSys=BR, PS=PSC24")
# ADC waveforms (both 10k and 1k)
dbLoadRecords("db/ADCWaveform.db",    "PSy=BR, PS=PSC24, TIMESTAMP=BST-TS{EVR:D3A}Cnt:BRPrev-I, ADC1K_POINTS=1014, ADC10K_POINTS=10150")
# adjusted ADC waveforms are below
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC24}ADC:00_Raw-I,  OUTPUT=BR{PSC24}ADC:00-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC24}ADC:01_Raw-I,  OUTPUT=BR{PSC24}ADC:01-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC24}ADC:02_Raw-I,  OUTPUT=BR{PSC24}ADC:02-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC24}ADC:03_Raw-I,  OUTPUT=BR{PSC24}ADC:03-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC24}ADC:04_Raw-I,  OUTPUT=BR{PSC24}ADC:04-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC24}ADC:05_Raw-I,  OUTPUT=BR{PSC24}ADC:05-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC24}ADC:06_Raw-I,  OUTPUT=BR{PSC24}ADC:06-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC24}ADC:07_Raw-I,  OUTPUT=BR{PSC24}ADC:07-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC24}ADC:08_Raw-I,  OUTPUT=BR{PSC24}ADC:08-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC24}ADC:09_Raw-I,  OUTPUT=BR{PSC24}ADC:09-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC24}ADC:10_Raw-I,  OUTPUT=BR{PSC24}ADC:10-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC24}ADC:11_Raw-I,  OUTPUT=BR{PSC24}ADC:11-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC24}ADC:12_Raw-I,  OUTPUT=BR{PSC24}ADC:12-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC24}ADC:13_Raw-I,  OUTPUT=BR{PSC24}ADC:13-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC24}ADC:14_Raw-I,  OUTPUT=BR{PSC24}ADC:14-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC24}ADC:15_Raw-I,  OUTPUT=BR{PSC24}ADC:15-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC24}ADC:16_Raw-I,  OUTPUT=BR{PSC24}ADC:16-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC24}ADC:17_Raw-I,  OUTPUT=BR{PSC24}ADC:17-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR{PSC24}ADC10k:0_Raw-I,  OUTPUT=BR{PSC24}ADC10k:0_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Average.db",        "INPUT=BR{PSC24}ADC10k:1_Raw-I,  OUTPUT=BR{PSC24}ADC10k:1_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Subtract.db",       "INPUT1=BR{PSC24}ADC10k:0_Raw-I, INPUT2=BR{PSC24}ADC10k:1_Raw-I, OUTPUT=BR{PSC24}ADC10k_Sub-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC24}ADC10k:0_Raw-I,  OUTPUT=BR{PSC24}ADC10k:0_Raw_I_FFT-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC24}ADC10k:1_Raw-I,  OUTPUT=BR{PSC24}ADC10k:1_Raw_I_FFT-I, WF_LENGTH=10150")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC24, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=0, MSGID=81, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC24}DAC:0-SP,         OUTPUT=BR{PSC24}DAC:0_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC24}DAC:0_Raw-SP,     OUTPUT=BR{PSC24}DAC:0_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC24}DAC:0_Raw_tr-SP,  OUTPUT=BR{PSC24}DAC:0_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC24, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=1, MSGID=82, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC24}DAC:1-SP,         OUTPUT=BR{PSC24}DAC:1_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC24}DAC:1_Raw-SP,     OUTPUT=BR{PSC24}DAC:1_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC24}DAC:1_Raw_tr-SP,  OUTPUT=BR{PSC24}DAC:1_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Commands.db",       "PriSys=BR, PS=PSC25")
dbLoadRecords("db/Status.db",         "PriSys=BR, PS=PSC25")
# ADC waveforms (both 10k and 1k)
dbLoadRecords("db/ADCWaveform.db",    "PSy=BR, PS=PSC25, TIMESTAMP=BST-TS{EVR:D3A}Cnt:BRPrev-I, ADC1K_POINTS=1014, ADC10K_POINTS=10150")
# adjusted ADC waveforms are below
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC25}ADC:00_Raw-I,  OUTPUT=BR{PSC25}ADC:00-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC25}ADC:01_Raw-I,  OUTPUT=BR{PSC25}ADC:01-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC25}ADC:02_Raw-I,  OUTPUT=BR{PSC25}ADC:02-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC25}ADC:03_Raw-I,  OUTPUT=BR{PSC25}ADC:03-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC25}ADC:04_Raw-I,  OUTPUT=BR{PSC25}ADC:04-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC25}ADC:05_Raw-I,  OUTPUT=BR{PSC25}ADC:05-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC25}ADC:06_Raw-I,  OUTPUT=BR{PSC25}ADC:06-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC25}ADC:07_Raw-I,  OUTPUT=BR{PSC25}ADC:07-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC25}ADC:08_Raw-I,  OUTPUT=BR{PSC25}ADC:08-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC25}ADC:09_Raw-I,  OUTPUT=BR{PSC25}ADC:09-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC25}ADC:10_Raw-I,  OUTPUT=BR{PSC25}ADC:10-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC25}ADC:11_Raw-I,  OUTPUT=BR{PSC25}ADC:11-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC25}ADC:12_Raw-I,  OUTPUT=BR{PSC25}ADC:12-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC25}ADC:13_Raw-I,  OUTPUT=BR{PSC25}ADC:13-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC25}ADC:14_Raw-I,  OUTPUT=BR{PSC25}ADC:14-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC25}ADC:15_Raw-I,  OUTPUT=BR{PSC25}ADC:15-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC25}ADC:16_Raw-I,  OUTPUT=BR{PSC25}ADC:16-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC25}ADC:17_Raw-I,  OUTPUT=BR{PSC25}ADC:17-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR{PSC25}ADC10k:0_Raw-I,  OUTPUT=BR{PSC25}ADC10k:0_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Average.db",        "INPUT=BR{PSC25}ADC10k:1_Raw-I,  OUTPUT=BR{PSC25}ADC10k:1_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Subtract.db",       "INPUT1=BR{PSC25}ADC10k:0_Raw-I, INPUT2=BR{PSC25}ADC10k:1_Raw-I, OUTPUT=BR{PSC25}ADC10k_Sub-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC25}ADC10k:0_Raw-I,  OUTPUT=BR{PSC25}ADC10k:0_Raw_I_FFT-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC25}ADC10k:1_Raw-I,  OUTPUT=BR{PSC25}ADC10k:1_Raw_I_FFT-I, WF_LENGTH=10150")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC25, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=0, MSGID=81, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC25}DAC:0-SP,         OUTPUT=BR{PSC25}DAC:0_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC25}DAC:0_Raw-SP,     OUTPUT=BR{PSC25}DAC:0_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC25}DAC:0_Raw_tr-SP,  OUTPUT=BR{PSC25}DAC:0_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC25, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=1, MSGID=82, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC25}DAC:1-SP,         OUTPUT=BR{PSC25}DAC:1_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC25}DAC:1_Raw-SP,     OUTPUT=BR{PSC25}DAC:1_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC25}DAC:1_Raw_tr-SP,  OUTPUT=BR{PSC25}DAC:1_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Commands.db",       "PriSys=BR, PS=PSC26")
dbLoadRecords("db/Status.db",         "PriSys=BR, PS=PSC26")
# ADC waveforms (both 10k and 1k)
dbLoadRecords("db/ADCWaveform.db",    "PSy=BR, PS=PSC26, TIMESTAMP=BST-TS{EVR:D3A}Cnt:BRPrev-I, ADC1K_POINTS=1014, ADC10K_POINTS=10150")
# adjusted ADC waveforms are below
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC26}ADC:00_Raw-I,  OUTPUT=BR{PSC26}ADC:00-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC26}ADC:01_Raw-I,  OUTPUT=BR{PSC26}ADC:01-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC26}ADC:02_Raw-I,  OUTPUT=BR{PSC26}ADC:02-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC26}ADC:03_Raw-I,  OUTPUT=BR{PSC26}ADC:03-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC26}ADC:04_Raw-I,  OUTPUT=BR{PSC26}ADC:04-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC26}ADC:05_Raw-I,  OUTPUT=BR{PSC26}ADC:05-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC26}ADC:06_Raw-I,  OUTPUT=BR{PSC26}ADC:06-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC26}ADC:07_Raw-I,  OUTPUT=BR{PSC26}ADC:07-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC26}ADC:08_Raw-I,  OUTPUT=BR{PSC26}ADC:08-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC26}ADC:09_Raw-I,  OUTPUT=BR{PSC26}ADC:09-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC26}ADC:10_Raw-I,  OUTPUT=BR{PSC26}ADC:10-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC26}ADC:11_Raw-I,  OUTPUT=BR{PSC26}ADC:11-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC26}ADC:12_Raw-I,  OUTPUT=BR{PSC26}ADC:12-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC26}ADC:13_Raw-I,  OUTPUT=BR{PSC26}ADC:13-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC26}ADC:14_Raw-I,  OUTPUT=BR{PSC26}ADC:14-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC26}ADC:15_Raw-I,  OUTPUT=BR{PSC26}ADC:15-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC26}ADC:16_Raw-I,  OUTPUT=BR{PSC26}ADC:16-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC26}ADC:17_Raw-I,  OUTPUT=BR{PSC26}ADC:17-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR{PSC26}ADC10k:0_Raw-I,  OUTPUT=BR{PSC26}ADC10k:0_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Average.db",        "INPUT=BR{PSC26}ADC10k:1_Raw-I,  OUTPUT=BR{PSC26}ADC10k:1_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Subtract.db",       "INPUT1=BR{PSC26}ADC10k:0_Raw-I, INPUT2=BR{PSC26}ADC10k:1_Raw-I, OUTPUT=BR{PSC26}ADC10k_Sub-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC26}ADC10k:0_Raw-I,  OUTPUT=BR{PSC26}ADC10k:0_Raw_I_FFT-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC26}ADC10k:1_Raw-I,  OUTPUT=BR{PSC26}ADC10k:1_Raw_I_FFT-I, WF_LENGTH=10150")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC26, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=0, MSGID=81, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC26}DAC:0-SP,         OUTPUT=BR{PSC26}DAC:0_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC26}DAC:0_Raw-SP,     OUTPUT=BR{PSC26}DAC:0_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC26}DAC:0_Raw_tr-SP,  OUTPUT=BR{PSC26}DAC:0_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC26, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=1, MSGID=82, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC26}DAC:1-SP,         OUTPUT=BR{PSC26}DAC:1_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC26}DAC:1_Raw-SP,     OUTPUT=BR{PSC26}DAC:1_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC26}DAC:1_Raw_tr-SP,  OUTPUT=BR{PSC26}DAC:1_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Commands.db",       "PriSys=BR, PS=PSC27")
dbLoadRecords("db/Status.db",         "PriSys=BR, PS=PSC27")
# ADC waveforms (both 10k and 1k)
dbLoadRecords("db/ADCWaveform.db",    "PSy=BR, PS=PSC27, TIMESTAMP=BST-TS{EVR:D3A}Cnt:BRPrev-I, ADC1K_POINTS=1014, ADC10K_POINTS=10150")
# adjusted ADC waveforms are below
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC27}ADC:00_Raw-I,  OUTPUT=BR{PSC27}ADC:00-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC27}ADC:01_Raw-I,  OUTPUT=BR{PSC27}ADC:01-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC27}ADC:02_Raw-I,  OUTPUT=BR{PSC27}ADC:02-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC27}ADC:03_Raw-I,  OUTPUT=BR{PSC27}ADC:03-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC27}ADC:04_Raw-I,  OUTPUT=BR{PSC27}ADC:04-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC27}ADC:05_Raw-I,  OUTPUT=BR{PSC27}ADC:05-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC27}ADC:06_Raw-I,  OUTPUT=BR{PSC27}ADC:06-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC27}ADC:07_Raw-I,  OUTPUT=BR{PSC27}ADC:07-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC27}ADC:08_Raw-I,  OUTPUT=BR{PSC27}ADC:08-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC27}ADC:09_Raw-I,  OUTPUT=BR{PSC27}ADC:09-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC27}ADC:10_Raw-I,  OUTPUT=BR{PSC27}ADC:10-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC27}ADC:11_Raw-I,  OUTPUT=BR{PSC27}ADC:11-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC27}ADC:12_Raw-I,  OUTPUT=BR{PSC27}ADC:12-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC27}ADC:13_Raw-I,  OUTPUT=BR{PSC27}ADC:13-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC27}ADC:14_Raw-I,  OUTPUT=BR{PSC27}ADC:14-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC27}ADC:15_Raw-I,  OUTPUT=BR{PSC27}ADC:15-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC27}ADC:16_Raw-I,  OUTPUT=BR{PSC27}ADC:16-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC27}ADC:17_Raw-I,  OUTPUT=BR{PSC27}ADC:17-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR{PSC27}ADC10k:0_Raw-I,  OUTPUT=BR{PSC27}ADC10k:0_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Average.db",        "INPUT=BR{PSC27}ADC10k:1_Raw-I,  OUTPUT=BR{PSC27}ADC10k:1_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Subtract.db",       "INPUT1=BR{PSC27}ADC10k:0_Raw-I, INPUT2=BR{PSC27}ADC10k:1_Raw-I, OUTPUT=BR{PSC27}ADC10k_Sub-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC27}ADC10k:0_Raw-I,  OUTPUT=BR{PSC27}ADC10k:0_Raw_I_FFT-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC27}ADC10k:1_Raw-I,  OUTPUT=BR{PSC27}ADC10k:1_Raw_I_FFT-I, WF_LENGTH=10150")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC27, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=0, MSGID=81, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC27}DAC:0-SP,         OUTPUT=BR{PSC27}DAC:0_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC27}DAC:0_Raw-SP,     OUTPUT=BR{PSC27}DAC:0_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC27}DAC:0_Raw_tr-SP,  OUTPUT=BR{PSC27}DAC:0_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC27, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=1, MSGID=82, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC27}DAC:1-SP,         OUTPUT=BR{PSC27}DAC:1_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC27}DAC:1_Raw-SP,     OUTPUT=BR{PSC27}DAC:1_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC27}DAC:1_Raw_tr-SP,  OUTPUT=BR{PSC27}DAC:1_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Commands.db",       "PriSys=BR, PS=PSC28")
dbLoadRecords("db/Status.db",         "PriSys=BR, PS=PSC28")
# ADC waveforms (both 10k and 1k)
dbLoadRecords("db/ADCWaveform.db",    "PSy=BR, PS=PSC28, TIMESTAMP=BST-TS{EVR:D3A}Cnt:BRPrev-I, ADC1K_POINTS=1014, ADC10K_POINTS=10150")
# adjusted ADC waveforms are below
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC28}ADC:00_Raw-I,  OUTPUT=BR{PSC28}ADC:00-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC28}ADC:01_Raw-I,  OUTPUT=BR{PSC28}ADC:01-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC28}ADC:02_Raw-I,  OUTPUT=BR{PSC28}ADC:02-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC28}ADC:03_Raw-I,  OUTPUT=BR{PSC28}ADC:03-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC28}ADC:04_Raw-I,  OUTPUT=BR{PSC28}ADC:04-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC28}ADC:05_Raw-I,  OUTPUT=BR{PSC28}ADC:05-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC28}ADC:06_Raw-I,  OUTPUT=BR{PSC28}ADC:06-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC28}ADC:07_Raw-I,  OUTPUT=BR{PSC28}ADC:07-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC28}ADC:08_Raw-I,  OUTPUT=BR{PSC28}ADC:08-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC28}ADC:09_Raw-I,  OUTPUT=BR{PSC28}ADC:09-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC28}ADC:10_Raw-I,  OUTPUT=BR{PSC28}ADC:10-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC28}ADC:11_Raw-I,  OUTPUT=BR{PSC28}ADC:11-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC28}ADC:12_Raw-I,  OUTPUT=BR{PSC28}ADC:12-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC28}ADC:13_Raw-I,  OUTPUT=BR{PSC28}ADC:13-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC28}ADC:14_Raw-I,  OUTPUT=BR{PSC28}ADC:14-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC28}ADC:15_Raw-I,  OUTPUT=BR{PSC28}ADC:15-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC28}ADC:16_Raw-I,  OUTPUT=BR{PSC28}ADC:16-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC28}ADC:17_Raw-I,  OUTPUT=BR{PSC28}ADC:17-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR{PSC28}ADC10k:0_Raw-I,  OUTPUT=BR{PSC28}ADC10k:0_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Average.db",        "INPUT=BR{PSC28}ADC10k:1_Raw-I,  OUTPUT=BR{PSC28}ADC10k:1_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Subtract.db",       "INPUT1=BR{PSC28}ADC10k:0_Raw-I, INPUT2=BR{PSC28}ADC10k:1_Raw-I, OUTPUT=BR{PSC28}ADC10k_Sub-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC28}ADC10k:0_Raw-I,  OUTPUT=BR{PSC28}ADC10k:0_Raw_I_FFT-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC28}ADC10k:1_Raw-I,  OUTPUT=BR{PSC28}ADC10k:1_Raw_I_FFT-I, WF_LENGTH=10150")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC28, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=0, MSGID=81, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC28}DAC:0-SP,         OUTPUT=BR{PSC28}DAC:0_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC28}DAC:0_Raw-SP,     OUTPUT=BR{PSC28}DAC:0_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC28}DAC:0_Raw_tr-SP,  OUTPUT=BR{PSC28}DAC:0_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC28, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=1, MSGID=82, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC28}DAC:1-SP,         OUTPUT=BR{PSC28}DAC:1_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC28}DAC:1_Raw-SP,     OUTPUT=BR{PSC28}DAC:1_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC28}DAC:1_Raw_tr-SP,  OUTPUT=BR{PSC28}DAC:1_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Commands.db",       "PriSys=BR, PS=PSC29")
dbLoadRecords("db/Status.db",         "PriSys=BR, PS=PSC29")
# ADC waveforms (both 10k and 1k)
dbLoadRecords("db/ADCWaveform.db",    "PSy=BR, PS=PSC29, TIMESTAMP=BST-TS{EVR:D3A}Cnt:BRPrev-I, ADC1K_POINTS=1014, ADC10K_POINTS=10150")
# adjusted ADC waveforms are below
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC29}ADC:00_Raw-I,  OUTPUT=BR{PSC29}ADC:00-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC29}ADC:01_Raw-I,  OUTPUT=BR{PSC29}ADC:01-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC29}ADC:02_Raw-I,  OUTPUT=BR{PSC29}ADC:02-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC29}ADC:03_Raw-I,  OUTPUT=BR{PSC29}ADC:03-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC29}ADC:04_Raw-I,  OUTPUT=BR{PSC29}ADC:04-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC29}ADC:05_Raw-I,  OUTPUT=BR{PSC29}ADC:05-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC29}ADC:06_Raw-I,  OUTPUT=BR{PSC29}ADC:06-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC29}ADC:07_Raw-I,  OUTPUT=BR{PSC29}ADC:07-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC29}ADC:08_Raw-I,  OUTPUT=BR{PSC29}ADC:08-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC29}ADC:09_Raw-I,  OUTPUT=BR{PSC29}ADC:09-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC29}ADC:10_Raw-I,  OUTPUT=BR{PSC29}ADC:10-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC29}ADC:11_Raw-I,  OUTPUT=BR{PSC29}ADC:11-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC29}ADC:12_Raw-I,  OUTPUT=BR{PSC29}ADC:12-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC29}ADC:13_Raw-I,  OUTPUT=BR{PSC29}ADC:13-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC29}ADC:14_Raw-I,  OUTPUT=BR{PSC29}ADC:14-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC29}ADC:15_Raw-I,  OUTPUT=BR{PSC29}ADC:15-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC29}ADC:16_Raw-I,  OUTPUT=BR{PSC29}ADC:16-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC29}ADC:17_Raw-I,  OUTPUT=BR{PSC29}ADC:17-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR{PSC29}ADC10k:0_Raw-I,  OUTPUT=BR{PSC29}ADC10k:0_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Average.db",        "INPUT=BR{PSC29}ADC10k:1_Raw-I,  OUTPUT=BR{PSC29}ADC10k:1_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Subtract.db",       "INPUT1=BR{PSC29}ADC10k:0_Raw-I, INPUT2=BR{PSC29}ADC10k:1_Raw-I, OUTPUT=BR{PSC29}ADC10k_Sub-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC29}ADC10k:0_Raw-I,  OUTPUT=BR{PSC29}ADC10k:0_Raw_I_FFT-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC29}ADC10k:1_Raw-I,  OUTPUT=BR{PSC29}ADC10k:1_Raw_I_FFT-I, WF_LENGTH=10150")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC29, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=0, MSGID=81, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC29}DAC:0-SP,         OUTPUT=BR{PSC29}DAC:0_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC29}DAC:0_Raw-SP,     OUTPUT=BR{PSC29}DAC:0_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC29}DAC:0_Raw_tr-SP,  OUTPUT=BR{PSC29}DAC:0_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC29, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=1, MSGID=82, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC29}DAC:1-SP,         OUTPUT=BR{PSC29}DAC:1_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC29}DAC:1_Raw-SP,     OUTPUT=BR{PSC29}DAC:1_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC29}DAC:1_Raw_tr-SP,  OUTPUT=BR{PSC29}DAC:1_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Commands.db",       "PriSys=BR, PS=PSC30")
dbLoadRecords("db/Status.db",         "PriSys=BR, PS=PSC30")
# ADC waveforms (both 10k and 1k)
dbLoadRecords("db/ADCWaveform.db",    "PSy=BR, PS=PSC30, TIMESTAMP=BST-TS{EVR:D3A}Cnt:BRPrev-I, ADC1K_POINTS=1014, ADC10K_POINTS=10150")
# adjusted ADC waveforms are below
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC30}ADC:00_Raw-I,  OUTPUT=BR{PSC30}ADC:00-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC30}ADC:01_Raw-I,  OUTPUT=BR{PSC30}ADC:01-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC30}ADC:02_Raw-I,  OUTPUT=BR{PSC30}ADC:02-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC30}ADC:03_Raw-I,  OUTPUT=BR{PSC30}ADC:03-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC30}ADC:04_Raw-I,  OUTPUT=BR{PSC30}ADC:04-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC30}ADC:05_Raw-I,  OUTPUT=BR{PSC30}ADC:05-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC30}ADC:06_Raw-I,  OUTPUT=BR{PSC30}ADC:06-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC30}ADC:07_Raw-I,  OUTPUT=BR{PSC30}ADC:07-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC30}ADC:08_Raw-I,  OUTPUT=BR{PSC30}ADC:08-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC30}ADC:09_Raw-I,  OUTPUT=BR{PSC30}ADC:09-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC30}ADC:10_Raw-I,  OUTPUT=BR{PSC30}ADC:10-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC30}ADC:11_Raw-I,  OUTPUT=BR{PSC30}ADC:11-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC30}ADC:12_Raw-I,  OUTPUT=BR{PSC30}ADC:12-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC30}ADC:13_Raw-I,  OUTPUT=BR{PSC30}ADC:13-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC30}ADC:14_Raw-I,  OUTPUT=BR{PSC30}ADC:14-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC30}ADC:15_Raw-I,  OUTPUT=BR{PSC30}ADC:15-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC30}ADC:16_Raw-I,  OUTPUT=BR{PSC30}ADC:16-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC30}ADC:17_Raw-I,  OUTPUT=BR{PSC30}ADC:17-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR{PSC30}ADC10k:0_Raw-I,  OUTPUT=BR{PSC30}ADC10k:0_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Average.db",        "INPUT=BR{PSC30}ADC10k:1_Raw-I,  OUTPUT=BR{PSC30}ADC10k:1_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Subtract.db",       "INPUT1=BR{PSC30}ADC10k:0_Raw-I, INPUT2=BR{PSC30}ADC10k:1_Raw-I, OUTPUT=BR{PSC30}ADC10k_Sub-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC30}ADC10k:0_Raw-I,  OUTPUT=BR{PSC30}ADC10k:0_Raw_I_FFT-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC30}ADC10k:1_Raw-I,  OUTPUT=BR{PSC30}ADC10k:1_Raw_I_FFT-I, WF_LENGTH=10150")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC30, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=0, MSGID=81, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC30}DAC:0-SP,         OUTPUT=BR{PSC30}DAC:0_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC30}DAC:0_Raw-SP,     OUTPUT=BR{PSC30}DAC:0_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC30}DAC:0_Raw_tr-SP,  OUTPUT=BR{PSC30}DAC:0_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC30, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=1, MSGID=82, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC30}DAC:1-SP,         OUTPUT=BR{PSC30}DAC:1_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC30}DAC:1_Raw-SP,     OUTPUT=BR{PSC30}DAC:1_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC30}DAC:1_Raw_tr-SP,  OUTPUT=BR{PSC30}DAC:1_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Commands.db",       "PriSys=BR, PS=PSC31")
dbLoadRecords("db/Status.db",         "PriSys=BR, PS=PSC31")
# ADC waveforms (both 10k and 1k)
dbLoadRecords("db/ADCWaveform.db",    "PSy=BR, PS=PSC31, TIMESTAMP=BST-TS{EVR:D3A}Cnt:BRPrev-I, ADC1K_POINTS=1014, ADC10K_POINTS=10150")
# adjusted ADC waveforms are below
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC31}ADC:00_Raw-I,  OUTPUT=BR{PSC31}ADC:00-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC31}ADC:01_Raw-I,  OUTPUT=BR{PSC31}ADC:01-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC31}ADC:02_Raw-I,  OUTPUT=BR{PSC31}ADC:02-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC31}ADC:03_Raw-I,  OUTPUT=BR{PSC31}ADC:03-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC31}ADC:04_Raw-I,  OUTPUT=BR{PSC31}ADC:04-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC31}ADC:05_Raw-I,  OUTPUT=BR{PSC31}ADC:05-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC31}ADC:06_Raw-I,  OUTPUT=BR{PSC31}ADC:06-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC31}ADC:07_Raw-I,  OUTPUT=BR{PSC31}ADC:07-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC31}ADC:08_Raw-I,  OUTPUT=BR{PSC31}ADC:08-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC31}ADC:09_Raw-I,  OUTPUT=BR{PSC31}ADC:09-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC31}ADC:10_Raw-I,  OUTPUT=BR{PSC31}ADC:10-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC31}ADC:11_Raw-I,  OUTPUT=BR{PSC31}ADC:11-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC31}ADC:12_Raw-I,  OUTPUT=BR{PSC31}ADC:12-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC31}ADC:13_Raw-I,  OUTPUT=BR{PSC31}ADC:13-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC31}ADC:14_Raw-I,  OUTPUT=BR{PSC31}ADC:14-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC31}ADC:15_Raw-I,  OUTPUT=BR{PSC31}ADC:15-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC31}ADC:16_Raw-I,  OUTPUT=BR{PSC31}ADC:16-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC31}ADC:17_Raw-I,  OUTPUT=BR{PSC31}ADC:17-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR{PSC31}ADC10k:0_Raw-I,  OUTPUT=BR{PSC31}ADC10k:0_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Average.db",        "INPUT=BR{PSC31}ADC10k:1_Raw-I,  OUTPUT=BR{PSC31}ADC10k:1_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Subtract.db",       "INPUT1=BR{PSC31}ADC10k:0_Raw-I, INPUT2=BR{PSC31}ADC10k:1_Raw-I, OUTPUT=BR{PSC31}ADC10k_Sub-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC31}ADC10k:0_Raw-I,  OUTPUT=BR{PSC31}ADC10k:0_Raw_I_FFT-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC31}ADC10k:1_Raw-I,  OUTPUT=BR{PSC31}ADC10k:1_Raw_I_FFT-I, WF_LENGTH=10150")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC31, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=0, MSGID=81, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC31}DAC:0-SP,         OUTPUT=BR{PSC31}DAC:0_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC31}DAC:0_Raw-SP,     OUTPUT=BR{PSC31}DAC:0_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC31}DAC:0_Raw_tr-SP,  OUTPUT=BR{PSC31}DAC:0_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC31, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=1, MSGID=82, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC31}DAC:1-SP,         OUTPUT=BR{PSC31}DAC:1_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC31}DAC:1_Raw-SP,     OUTPUT=BR{PSC31}DAC:1_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC31}DAC:1_Raw_tr-SP,  OUTPUT=BR{PSC31}DAC:1_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Commands.db",       "PriSys=BR, PS=PSC32")
dbLoadRecords("db/Status.db",         "PriSys=BR, PS=PSC32")
# ADC waveforms (both 10k and 1k)
dbLoadRecords("db/ADCWaveform.db",    "PSy=BR, PS=PSC32, TIMESTAMP=BST-TS{EVR:D3A}Cnt:BRPrev-I, ADC1K_POINTS=1014, ADC10K_POINTS=10150")
# adjusted ADC waveforms are below
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC32}ADC:00_Raw-I,  OUTPUT=BR{PSC32}ADC:00-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC32}ADC:01_Raw-I,  OUTPUT=BR{PSC32}ADC:01-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC32}ADC:02_Raw-I,  OUTPUT=BR{PSC32}ADC:02-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC32}ADC:03_Raw-I,  OUTPUT=BR{PSC32}ADC:03-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC32}ADC:04_Raw-I,  OUTPUT=BR{PSC32}ADC:04-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC32}ADC:05_Raw-I,  OUTPUT=BR{PSC32}ADC:05-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC32}ADC:06_Raw-I,  OUTPUT=BR{PSC32}ADC:06-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC32}ADC:07_Raw-I,  OUTPUT=BR{PSC32}ADC:07-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC32}ADC:08_Raw-I,  OUTPUT=BR{PSC32}ADC:08-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC32}ADC:09_Raw-I,  OUTPUT=BR{PSC32}ADC:09-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC32}ADC:10_Raw-I,  OUTPUT=BR{PSC32}ADC:10-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC32}ADC:11_Raw-I,  OUTPUT=BR{PSC32}ADC:11-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC32}ADC:12_Raw-I,  OUTPUT=BR{PSC32}ADC:12-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC32}ADC:13_Raw-I,  OUTPUT=BR{PSC32}ADC:13-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC32}ADC:14_Raw-I,  OUTPUT=BR{PSC32}ADC:14-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC32}ADC:15_Raw-I,  OUTPUT=BR{PSC32}ADC:15-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC32}ADC:16_Raw-I,  OUTPUT=BR{PSC32}ADC:16-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC32}ADC:17_Raw-I,  OUTPUT=BR{PSC32}ADC:17-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR{PSC32}ADC10k:0_Raw-I,  OUTPUT=BR{PSC32}ADC10k:0_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Average.db",        "INPUT=BR{PSC32}ADC10k:1_Raw-I,  OUTPUT=BR{PSC32}ADC10k:1_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Subtract.db",       "INPUT1=BR{PSC32}ADC10k:0_Raw-I, INPUT2=BR{PSC32}ADC10k:1_Raw-I, OUTPUT=BR{PSC32}ADC10k_Sub-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC32}ADC10k:0_Raw-I,  OUTPUT=BR{PSC32}ADC10k:0_Raw_I_FFT-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC32}ADC10k:1_Raw-I,  OUTPUT=BR{PSC32}ADC10k:1_Raw_I_FFT-I, WF_LENGTH=10150")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC32, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=0, MSGID=81, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC32}DAC:0-SP,         OUTPUT=BR{PSC32}DAC:0_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC32}DAC:0_Raw-SP,     OUTPUT=BR{PSC32}DAC:0_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC32}DAC:0_Raw_tr-SP,  OUTPUT=BR{PSC32}DAC:0_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC32, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=1, MSGID=82, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC32}DAC:1-SP,         OUTPUT=BR{PSC32}DAC:1_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC32}DAC:1_Raw-SP,     OUTPUT=BR{PSC32}DAC:1_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC32}DAC:1_Raw_tr-SP,  OUTPUT=BR{PSC32}DAC:1_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Commands.db",       "PriSys=BR, PS=PSC33")
dbLoadRecords("db/Status.db",         "PriSys=BR, PS=PSC33")
# ADC waveforms (both 10k and 1k)
dbLoadRecords("db/ADCWaveform.db",    "PSy=BR, PS=PSC33, TIMESTAMP=BST-TS{EVR:D3A}Cnt:BRPrev-I, ADC1K_POINTS=1014, ADC10K_POINTS=10150")
# adjusted ADC waveforms are below
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC33}ADC:00_Raw-I,  OUTPUT=BR{PSC33}ADC:00-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC33}ADC:01_Raw-I,  OUTPUT=BR{PSC33}ADC:01-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC33}ADC:02_Raw-I,  OUTPUT=BR{PSC33}ADC:02-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC33}ADC:03_Raw-I,  OUTPUT=BR{PSC33}ADC:03-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC33}ADC:04_Raw-I,  OUTPUT=BR{PSC33}ADC:04-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC33}ADC:05_Raw-I,  OUTPUT=BR{PSC33}ADC:05-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC33}ADC:06_Raw-I,  OUTPUT=BR{PSC33}ADC:06-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC33}ADC:07_Raw-I,  OUTPUT=BR{PSC33}ADC:07-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC33}ADC:08_Raw-I,  OUTPUT=BR{PSC33}ADC:08-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC33}ADC:09_Raw-I,  OUTPUT=BR{PSC33}ADC:09-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC33}ADC:10_Raw-I,  OUTPUT=BR{PSC33}ADC:10-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC33}ADC:11_Raw-I,  OUTPUT=BR{PSC33}ADC:11-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC33}ADC:12_Raw-I,  OUTPUT=BR{PSC33}ADC:12-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC33}ADC:13_Raw-I,  OUTPUT=BR{PSC33}ADC:13-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC33}ADC:14_Raw-I,  OUTPUT=BR{PSC33}ADC:14-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC33}ADC:15_Raw-I,  OUTPUT=BR{PSC33}ADC:15-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC33}ADC:16_Raw-I,  OUTPUT=BR{PSC33}ADC:16-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC33}ADC:17_Raw-I,  OUTPUT=BR{PSC33}ADC:17-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR{PSC33}ADC10k:0_Raw-I,  OUTPUT=BR{PSC33}ADC10k:0_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Average.db",        "INPUT=BR{PSC33}ADC10k:1_Raw-I,  OUTPUT=BR{PSC33}ADC10k:1_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Subtract.db",       "INPUT1=BR{PSC33}ADC10k:0_Raw-I, INPUT2=BR{PSC33}ADC10k:1_Raw-I, OUTPUT=BR{PSC33}ADC10k_Sub-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC33}ADC10k:0_Raw-I,  OUTPUT=BR{PSC33}ADC10k:0_Raw_I_FFT-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC33}ADC10k:1_Raw-I,  OUTPUT=BR{PSC33}ADC10k:1_Raw_I_FFT-I, WF_LENGTH=10150")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC33, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=0, MSGID=81, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC33}DAC:0-SP,         OUTPUT=BR{PSC33}DAC:0_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC33}DAC:0_Raw-SP,     OUTPUT=BR{PSC33}DAC:0_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC33}DAC:0_Raw_tr-SP,  OUTPUT=BR{PSC33}DAC:0_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC33, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=1, MSGID=82, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC33}DAC:1-SP,         OUTPUT=BR{PSC33}DAC:1_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC33}DAC:1_Raw-SP,     OUTPUT=BR{PSC33}DAC:1_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC33}DAC:1_Raw_tr-SP,  OUTPUT=BR{PSC33}DAC:1_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Commands.db",       "PriSys=BR, PS=PSC34")
dbLoadRecords("db/Status.db",         "PriSys=BR, PS=PSC34")
# ADC waveforms (both 10k and 1k)
dbLoadRecords("db/ADCWaveform.db",    "PSy=BR, PS=PSC34, TIMESTAMP=BST-TS{EVR:D3A}Cnt:BRPrev-I, ADC1K_POINTS=1014, ADC10K_POINTS=10150")
# adjusted ADC waveforms are below
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC34}ADC:00_Raw-I,  OUTPUT=BR{PSC34}ADC:00-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC34}ADC:01_Raw-I,  OUTPUT=BR{PSC34}ADC:01-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC34}ADC:02_Raw-I,  OUTPUT=BR{PSC34}ADC:02-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC34}ADC:03_Raw-I,  OUTPUT=BR{PSC34}ADC:03-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC34}ADC:04_Raw-I,  OUTPUT=BR{PSC34}ADC:04-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC34}ADC:05_Raw-I,  OUTPUT=BR{PSC34}ADC:05-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC34}ADC:06_Raw-I,  OUTPUT=BR{PSC34}ADC:06-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC34}ADC:07_Raw-I,  OUTPUT=BR{PSC34}ADC:07-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC34}ADC:08_Raw-I,  OUTPUT=BR{PSC34}ADC:08-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC34}ADC:09_Raw-I,  OUTPUT=BR{PSC34}ADC:09-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC34}ADC:10_Raw-I,  OUTPUT=BR{PSC34}ADC:10-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC34}ADC:11_Raw-I,  OUTPUT=BR{PSC34}ADC:11-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC34}ADC:12_Raw-I,  OUTPUT=BR{PSC34}ADC:12-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC34}ADC:13_Raw-I,  OUTPUT=BR{PSC34}ADC:13-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC34}ADC:14_Raw-I,  OUTPUT=BR{PSC34}ADC:14-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC34}ADC:15_Raw-I,  OUTPUT=BR{PSC34}ADC:15-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC34}ADC:16_Raw-I,  OUTPUT=BR{PSC34}ADC:16-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC34}ADC:17_Raw-I,  OUTPUT=BR{PSC34}ADC:17-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR{PSC34}ADC10k:0_Raw-I,  OUTPUT=BR{PSC34}ADC10k:0_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Average.db",        "INPUT=BR{PSC34}ADC10k:1_Raw-I,  OUTPUT=BR{PSC34}ADC10k:1_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Subtract.db",       "INPUT1=BR{PSC34}ADC10k:0_Raw-I, INPUT2=BR{PSC34}ADC10k:1_Raw-I, OUTPUT=BR{PSC34}ADC10k_Sub-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC34}ADC10k:0_Raw-I,  OUTPUT=BR{PSC34}ADC10k:0_Raw_I_FFT-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC34}ADC10k:1_Raw-I,  OUTPUT=BR{PSC34}ADC10k:1_Raw_I_FFT-I, WF_LENGTH=10150")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC34, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=0, MSGID=81, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC34}DAC:0-SP,         OUTPUT=BR{PSC34}DAC:0_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC34}DAC:0_Raw-SP,     OUTPUT=BR{PSC34}DAC:0_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC34}DAC:0_Raw_tr-SP,  OUTPUT=BR{PSC34}DAC:0_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC34, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=1, MSGID=82, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC34}DAC:1-SP,         OUTPUT=BR{PSC34}DAC:1_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC34}DAC:1_Raw-SP,     OUTPUT=BR{PSC34}DAC:1_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC34}DAC:1_Raw_tr-SP,  OUTPUT=BR{PSC34}DAC:1_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Commands.db",       "PriSys=BR, PS=PSC35")
dbLoadRecords("db/Status.db",         "PriSys=BR, PS=PSC35")
# ADC waveforms (both 10k and 1k)
dbLoadRecords("db/ADCWaveform.db",    "PSy=BR, PS=PSC35, TIMESTAMP=BST-TS{EVR:D3A}Cnt:BRPrev-I, ADC1K_POINTS=1014, ADC10K_POINTS=10150")
# adjusted ADC waveforms are below
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC35}ADC:00_Raw-I,  OUTPUT=BR{PSC35}ADC:00-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC35}ADC:01_Raw-I,  OUTPUT=BR{PSC35}ADC:01-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC35}ADC:02_Raw-I,  OUTPUT=BR{PSC35}ADC:02-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC35}ADC:03_Raw-I,  OUTPUT=BR{PSC35}ADC:03-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC35}ADC:04_Raw-I,  OUTPUT=BR{PSC35}ADC:04-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC35}ADC:05_Raw-I,  OUTPUT=BR{PSC35}ADC:05-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC35}ADC:06_Raw-I,  OUTPUT=BR{PSC35}ADC:06-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC35}ADC:07_Raw-I,  OUTPUT=BR{PSC35}ADC:07-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC35}ADC:08_Raw-I,  OUTPUT=BR{PSC35}ADC:08-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC35}ADC:09_Raw-I,  OUTPUT=BR{PSC35}ADC:09-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC35}ADC:10_Raw-I,  OUTPUT=BR{PSC35}ADC:10-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC35}ADC:11_Raw-I,  OUTPUT=BR{PSC35}ADC:11-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC35}ADC:12_Raw-I,  OUTPUT=BR{PSC35}ADC:12-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC35}ADC:13_Raw-I,  OUTPUT=BR{PSC35}ADC:13-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC35}ADC:14_Raw-I,  OUTPUT=BR{PSC35}ADC:14-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC35}ADC:15_Raw-I,  OUTPUT=BR{PSC35}ADC:15-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC35}ADC:16_Raw-I,  OUTPUT=BR{PSC35}ADC:16-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC35}ADC:17_Raw-I,  OUTPUT=BR{PSC35}ADC:17-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR{PSC35}ADC10k:0_Raw-I,  OUTPUT=BR{PSC35}ADC10k:0_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Average.db",        "INPUT=BR{PSC35}ADC10k:1_Raw-I,  OUTPUT=BR{PSC35}ADC10k:1_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Subtract.db",       "INPUT1=BR{PSC35}ADC10k:0_Raw-I, INPUT2=BR{PSC35}ADC10k:1_Raw-I, OUTPUT=BR{PSC35}ADC10k_Sub-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC35}ADC10k:0_Raw-I,  OUTPUT=BR{PSC35}ADC10k:0_Raw_I_FFT-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC35}ADC10k:1_Raw-I,  OUTPUT=BR{PSC35}ADC10k:1_Raw_I_FFT-I, WF_LENGTH=10150")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC35, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=0, MSGID=81, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC35}DAC:0-SP,         OUTPUT=BR{PSC35}DAC:0_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC35}DAC:0_Raw-SP,     OUTPUT=BR{PSC35}DAC:0_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC35}DAC:0_Raw_tr-SP,  OUTPUT=BR{PSC35}DAC:0_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC35, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=1, MSGID=82, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC35}DAC:1-SP,         OUTPUT=BR{PSC35}DAC:1_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC35}DAC:1_Raw-SP,     OUTPUT=BR{PSC35}DAC:1_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC35}DAC:1_Raw_tr-SP,  OUTPUT=BR{PSC35}DAC:1_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Commands.db",       "PriSys=BR, PS=PSC36")
dbLoadRecords("db/Status.db",         "PriSys=BR, PS=PSC36")
# ADC waveforms (both 10k and 1k)
dbLoadRecords("db/ADCWaveform.db",    "PSy=BR, PS=PSC36, TIMESTAMP=BST-TS{EVR:D3A}Cnt:BRPrev-I, ADC1K_POINTS=1014, ADC10K_POINTS=10150")
# adjusted ADC waveforms are below
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC36}ADC:00_Raw-I,  OUTPUT=BR{PSC36}ADC:00-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC36}ADC:01_Raw-I,  OUTPUT=BR{PSC36}ADC:01-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC36}ADC:02_Raw-I,  OUTPUT=BR{PSC36}ADC:02-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC36}ADC:03_Raw-I,  OUTPUT=BR{PSC36}ADC:03-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC36}ADC:04_Raw-I,  OUTPUT=BR{PSC36}ADC:04-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC36}ADC:05_Raw-I,  OUTPUT=BR{PSC36}ADC:05-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC36}ADC:06_Raw-I,  OUTPUT=BR{PSC36}ADC:06-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC36}ADC:07_Raw-I,  OUTPUT=BR{PSC36}ADC:07-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC36}ADC:08_Raw-I,  OUTPUT=BR{PSC36}ADC:08-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC36}ADC:09_Raw-I,  OUTPUT=BR{PSC36}ADC:09-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC36}ADC:10_Raw-I,  OUTPUT=BR{PSC36}ADC:10-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC36}ADC:11_Raw-I,  OUTPUT=BR{PSC36}ADC:11-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC36}ADC:12_Raw-I,  OUTPUT=BR{PSC36}ADC:12-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC36}ADC:13_Raw-I,  OUTPUT=BR{PSC36}ADC:13-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC36}ADC:14_Raw-I,  OUTPUT=BR{PSC36}ADC:14-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC36}ADC:15_Raw-I,  OUTPUT=BR{PSC36}ADC:15-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC36}ADC:16_Raw-I,  OUTPUT=BR{PSC36}ADC:16-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC36}ADC:17_Raw-I,  OUTPUT=BR{PSC36}ADC:17-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR{PSC36}ADC10k:0_Raw-I,  OUTPUT=BR{PSC36}ADC10k:0_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Average.db",        "INPUT=BR{PSC36}ADC10k:1_Raw-I,  OUTPUT=BR{PSC36}ADC10k:1_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Subtract.db",       "INPUT1=BR{PSC36}ADC10k:0_Raw-I, INPUT2=BR{PSC36}ADC10k:1_Raw-I, OUTPUT=BR{PSC36}ADC10k_Sub-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC36}ADC10k:0_Raw-I,  OUTPUT=BR{PSC36}ADC10k:0_Raw_I_FFT-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC36}ADC10k:1_Raw-I,  OUTPUT=BR{PSC36}ADC10k:1_Raw_I_FFT-I, WF_LENGTH=10150")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC36, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=0, MSGID=81, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC36}DAC:0-SP,         OUTPUT=BR{PSC36}DAC:0_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC36}DAC:0_Raw-SP,     OUTPUT=BR{PSC36}DAC:0_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC36}DAC:0_Raw_tr-SP,  OUTPUT=BR{PSC36}DAC:0_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC36, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=1, MSGID=82, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC36}DAC:1-SP,         OUTPUT=BR{PSC36}DAC:1_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC36}DAC:1_Raw-SP,     OUTPUT=BR{PSC36}DAC:1_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC36}DAC:1_Raw_tr-SP,  OUTPUT=BR{PSC36}DAC:1_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Commands.db",       "PriSys=BR, PS=PSC37")
dbLoadRecords("db/Status.db",         "PriSys=BR, PS=PSC37")
# ADC waveforms (both 10k and 1k)
dbLoadRecords("db/ADCWaveform.db",    "PSy=BR, PS=PSC37, TIMESTAMP=BST-TS{EVR:D3A}Cnt:BRPrev-I, ADC1K_POINTS=1014, ADC10K_POINTS=10150")
# adjusted ADC waveforms are below
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC37}ADC:00_Raw-I,  OUTPUT=BR{PSC37}ADC:00-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC37}ADC:01_Raw-I,  OUTPUT=BR{PSC37}ADC:01-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC37}ADC:02_Raw-I,  OUTPUT=BR{PSC37}ADC:02-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC37}ADC:03_Raw-I,  OUTPUT=BR{PSC37}ADC:03-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC37}ADC:04_Raw-I,  OUTPUT=BR{PSC37}ADC:04-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC37}ADC:05_Raw-I,  OUTPUT=BR{PSC37}ADC:05-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC37}ADC:06_Raw-I,  OUTPUT=BR{PSC37}ADC:06-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC37}ADC:07_Raw-I,  OUTPUT=BR{PSC37}ADC:07-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC37}ADC:08_Raw-I,  OUTPUT=BR{PSC37}ADC:08-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC37}ADC:09_Raw-I,  OUTPUT=BR{PSC37}ADC:09-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC37}ADC:10_Raw-I,  OUTPUT=BR{PSC37}ADC:10-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC37}ADC:11_Raw-I,  OUTPUT=BR{PSC37}ADC:11-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC37}ADC:12_Raw-I,  OUTPUT=BR{PSC37}ADC:12-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC37}ADC:13_Raw-I,  OUTPUT=BR{PSC37}ADC:13-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC37}ADC:14_Raw-I,  OUTPUT=BR{PSC37}ADC:14-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC37}ADC:15_Raw-I,  OUTPUT=BR{PSC37}ADC:15-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC37}ADC:16_Raw-I,  OUTPUT=BR{PSC37}ADC:16-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC37}ADC:17_Raw-I,  OUTPUT=BR{PSC37}ADC:17-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR{PSC37}ADC10k:0_Raw-I,  OUTPUT=BR{PSC37}ADC10k:0_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Average.db",        "INPUT=BR{PSC37}ADC10k:1_Raw-I,  OUTPUT=BR{PSC37}ADC10k:1_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Subtract.db",       "INPUT1=BR{PSC37}ADC10k:0_Raw-I, INPUT2=BR{PSC37}ADC10k:1_Raw-I, OUTPUT=BR{PSC37}ADC10k_Sub-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC37}ADC10k:0_Raw-I,  OUTPUT=BR{PSC37}ADC10k:0_Raw_I_FFT-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC37}ADC10k:1_Raw-I,  OUTPUT=BR{PSC37}ADC10k:1_Raw_I_FFT-I, WF_LENGTH=10150")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC37, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=0, MSGID=81, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC37}DAC:0-SP,         OUTPUT=BR{PSC37}DAC:0_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC37}DAC:0_Raw-SP,     OUTPUT=BR{PSC37}DAC:0_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC37}DAC:0_Raw_tr-SP,  OUTPUT=BR{PSC37}DAC:0_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC37, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=1, MSGID=82, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC37}DAC:1-SP,         OUTPUT=BR{PSC37}DAC:1_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC37}DAC:1_Raw-SP,     OUTPUT=BR{PSC37}DAC:1_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC37}DAC:1_Raw_tr-SP,  OUTPUT=BR{PSC37}DAC:1_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Commands.db",       "PriSys=BR, PS=PSC38")
dbLoadRecords("db/Status.db",         "PriSys=BR, PS=PSC38")
# ADC waveforms (both 10k and 1k)
dbLoadRecords("db/ADCWaveform.db",    "PSy=BR, PS=PSC38, TIMESTAMP=BST-TS{EVR:D3A}Cnt:BRPrev-I, ADC1K_POINTS=1014, ADC10K_POINTS=10150")
# adjusted ADC waveforms are below
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC38}ADC:00_Raw-I,  OUTPUT=BR{PSC38}ADC:00-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC38}ADC:01_Raw-I,  OUTPUT=BR{PSC38}ADC:01-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC38}ADC:02_Raw-I,  OUTPUT=BR{PSC38}ADC:02-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC38}ADC:03_Raw-I,  OUTPUT=BR{PSC38}ADC:03-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC38}ADC:04_Raw-I,  OUTPUT=BR{PSC38}ADC:04-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC38}ADC:05_Raw-I,  OUTPUT=BR{PSC38}ADC:05-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC38}ADC:06_Raw-I,  OUTPUT=BR{PSC38}ADC:06-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC38}ADC:07_Raw-I,  OUTPUT=BR{PSC38}ADC:07-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC38}ADC:08_Raw-I,  OUTPUT=BR{PSC38}ADC:08-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC38}ADC:09_Raw-I,  OUTPUT=BR{PSC38}ADC:09-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC38}ADC:10_Raw-I,  OUTPUT=BR{PSC38}ADC:10-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC38}ADC:11_Raw-I,  OUTPUT=BR{PSC38}ADC:11-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC38}ADC:12_Raw-I,  OUTPUT=BR{PSC38}ADC:12-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC38}ADC:13_Raw-I,  OUTPUT=BR{PSC38}ADC:13-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC38}ADC:14_Raw-I,  OUTPUT=BR{PSC38}ADC:14-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC38}ADC:15_Raw-I,  OUTPUT=BR{PSC38}ADC:15-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC38}ADC:16_Raw-I,  OUTPUT=BR{PSC38}ADC:16-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC38}ADC:17_Raw-I,  OUTPUT=BR{PSC38}ADC:17-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR{PSC38}ADC10k:0_Raw-I,  OUTPUT=BR{PSC38}ADC10k:0_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Average.db",        "INPUT=BR{PSC38}ADC10k:1_Raw-I,  OUTPUT=BR{PSC38}ADC10k:1_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Subtract.db",       "INPUT1=BR{PSC38}ADC10k:0_Raw-I, INPUT2=BR{PSC38}ADC10k:1_Raw-I, OUTPUT=BR{PSC38}ADC10k_Sub-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC38}ADC10k:0_Raw-I,  OUTPUT=BR{PSC38}ADC10k:0_Raw_I_FFT-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC38}ADC10k:1_Raw-I,  OUTPUT=BR{PSC38}ADC10k:1_Raw_I_FFT-I, WF_LENGTH=10150")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC38, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=0, MSGID=81, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC38}DAC:0-SP,         OUTPUT=BR{PSC38}DAC:0_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC38}DAC:0_Raw-SP,     OUTPUT=BR{PSC38}DAC:0_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC38}DAC:0_Raw_tr-SP,  OUTPUT=BR{PSC38}DAC:0_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC38, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=1, MSGID=82, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC38}DAC:1-SP,         OUTPUT=BR{PSC38}DAC:1_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC38}DAC:1_Raw-SP,     OUTPUT=BR{PSC38}DAC:1_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC38}DAC:1_Raw_tr-SP,  OUTPUT=BR{PSC38}DAC:1_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Commands.db",       "PriSys=BR, PS=PSC39")
dbLoadRecords("db/Status.db",         "PriSys=BR, PS=PSC39")
# ADC waveforms (both 10k and 1k)
dbLoadRecords("db/ADCWaveform.db",    "PSy=BR, PS=PSC39, TIMESTAMP=BST-TS{EVR:D3A}Cnt:BRPrev-I, ADC1K_POINTS=1014, ADC10K_POINTS=10150")
# adjusted ADC waveforms are below
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC39}ADC:00_Raw-I,  OUTPUT=BR{PSC39}ADC:00-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC39}ADC:01_Raw-I,  OUTPUT=BR{PSC39}ADC:01-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC39}ADC:02_Raw-I,  OUTPUT=BR{PSC39}ADC:02-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC39}ADC:03_Raw-I,  OUTPUT=BR{PSC39}ADC:03-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC39}ADC:04_Raw-I,  OUTPUT=BR{PSC39}ADC:04-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC39}ADC:05_Raw-I,  OUTPUT=BR{PSC39}ADC:05-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC39}ADC:06_Raw-I,  OUTPUT=BR{PSC39}ADC:06-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC39}ADC:07_Raw-I,  OUTPUT=BR{PSC39}ADC:07-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC39}ADC:08_Raw-I,  OUTPUT=BR{PSC39}ADC:08-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC39}ADC:09_Raw-I,  OUTPUT=BR{PSC39}ADC:09-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC39}ADC:10_Raw-I,  OUTPUT=BR{PSC39}ADC:10-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC39}ADC:11_Raw-I,  OUTPUT=BR{PSC39}ADC:11-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC39}ADC:12_Raw-I,  OUTPUT=BR{PSC39}ADC:12-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC39}ADC:13_Raw-I,  OUTPUT=BR{PSC39}ADC:13-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC39}ADC:14_Raw-I,  OUTPUT=BR{PSC39}ADC:14-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC39}ADC:15_Raw-I,  OUTPUT=BR{PSC39}ADC:15-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC39}ADC:16_Raw-I,  OUTPUT=BR{PSC39}ADC:16-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC39}ADC:17_Raw-I,  OUTPUT=BR{PSC39}ADC:17-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR{PSC39}ADC10k:0_Raw-I,  OUTPUT=BR{PSC39}ADC10k:0_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Average.db",        "INPUT=BR{PSC39}ADC10k:1_Raw-I,  OUTPUT=BR{PSC39}ADC10k:1_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Subtract.db",       "INPUT1=BR{PSC39}ADC10k:0_Raw-I, INPUT2=BR{PSC39}ADC10k:1_Raw-I, OUTPUT=BR{PSC39}ADC10k_Sub-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC39}ADC10k:0_Raw-I,  OUTPUT=BR{PSC39}ADC10k:0_Raw_I_FFT-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC39}ADC10k:1_Raw-I,  OUTPUT=BR{PSC39}ADC10k:1_Raw_I_FFT-I, WF_LENGTH=10150")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC39, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=0, MSGID=81, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC39}DAC:0-SP,         OUTPUT=BR{PSC39}DAC:0_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC39}DAC:0_Raw-SP,     OUTPUT=BR{PSC39}DAC:0_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC39}DAC:0_Raw_tr-SP,  OUTPUT=BR{PSC39}DAC:0_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC39, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=1, MSGID=82, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC39}DAC:1-SP,         OUTPUT=BR{PSC39}DAC:1_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC39}DAC:1_Raw-SP,     OUTPUT=BR{PSC39}DAC:1_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC39}DAC:1_Raw_tr-SP,  OUTPUT=BR{PSC39}DAC:1_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Commands.db",       "PriSys=BR, PS=PSC40")
dbLoadRecords("db/Status.db",         "PriSys=BR, PS=PSC40")
# ADC waveforms (both 10k and 1k)
dbLoadRecords("db/ADCWaveform.db",    "PSy=BR, PS=PSC40, TIMESTAMP=BST-TS{EVR:D3A}Cnt:BRPrev-I, ADC1K_POINTS=1014, ADC10K_POINTS=10150")
# adjusted ADC waveforms are below
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC40}ADC:00_Raw-I,  OUTPUT=BR{PSC40}ADC:00-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC40}ADC:01_Raw-I,  OUTPUT=BR{PSC40}ADC:01-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC40}ADC:02_Raw-I,  OUTPUT=BR{PSC40}ADC:02-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC40}ADC:03_Raw-I,  OUTPUT=BR{PSC40}ADC:03-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC40}ADC:04_Raw-I,  OUTPUT=BR{PSC40}ADC:04-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC40}ADC:05_Raw-I,  OUTPUT=BR{PSC40}ADC:05-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC40}ADC:06_Raw-I,  OUTPUT=BR{PSC40}ADC:06-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC40}ADC:07_Raw-I,  OUTPUT=BR{PSC40}ADC:07-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC40}ADC:08_Raw-I,  OUTPUT=BR{PSC40}ADC:08-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC40}ADC:09_Raw-I,  OUTPUT=BR{PSC40}ADC:09-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC40}ADC:10_Raw-I,  OUTPUT=BR{PSC40}ADC:10-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC40}ADC:11_Raw-I,  OUTPUT=BR{PSC40}ADC:11-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC40}ADC:12_Raw-I,  OUTPUT=BR{PSC40}ADC:12-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC40}ADC:13_Raw-I,  OUTPUT=BR{PSC40}ADC:13-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC40}ADC:14_Raw-I,  OUTPUT=BR{PSC40}ADC:14-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC40}ADC:15_Raw-I,  OUTPUT=BR{PSC40}ADC:15-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC40}ADC:16_Raw-I,  OUTPUT=BR{PSC40}ADC:16-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC40}ADC:17_Raw-I,  OUTPUT=BR{PSC40}ADC:17-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR{PSC40}ADC10k:0_Raw-I,  OUTPUT=BR{PSC40}ADC10k:0_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Average.db",        "INPUT=BR{PSC40}ADC10k:1_Raw-I,  OUTPUT=BR{PSC40}ADC10k:1_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Subtract.db",       "INPUT1=BR{PSC40}ADC10k:0_Raw-I, INPUT2=BR{PSC40}ADC10k:1_Raw-I, OUTPUT=BR{PSC40}ADC10k_Sub-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC40}ADC10k:0_Raw-I,  OUTPUT=BR{PSC40}ADC10k:0_Raw_I_FFT-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC40}ADC10k:1_Raw-I,  OUTPUT=BR{PSC40}ADC10k:1_Raw_I_FFT-I, WF_LENGTH=10150")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC40, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=0, MSGID=81, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC40}DAC:0-SP,         OUTPUT=BR{PSC40}DAC:0_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC40}DAC:0_Raw-SP,     OUTPUT=BR{PSC40}DAC:0_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC40}DAC:0_Raw_tr-SP,  OUTPUT=BR{PSC40}DAC:0_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC40, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=1, MSGID=82, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC40}DAC:1-SP,         OUTPUT=BR{PSC40}DAC:1_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC40}DAC:1_Raw-SP,     OUTPUT=BR{PSC40}DAC:1_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC40}DAC:1_Raw_tr-SP,  OUTPUT=BR{PSC40}DAC:1_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Commands.db",       "PriSys=BR, PS=PSC41")
dbLoadRecords("db/Status.db",         "PriSys=BR, PS=PSC41")
# ADC waveforms (both 10k and 1k)
dbLoadRecords("db/ADCWaveform.db",    "PSy=BR, PS=PSC41, TIMESTAMP=BST-TS{EVR:D3A}Cnt:BRPrev-I, ADC1K_POINTS=1014, ADC10K_POINTS=10150")
# adjusted ADC waveforms are below
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC41}ADC:00_Raw-I,  OUTPUT=BR{PSC41}ADC:00-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC41}ADC:01_Raw-I,  OUTPUT=BR{PSC41}ADC:01-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC41}ADC:02_Raw-I,  OUTPUT=BR{PSC41}ADC:02-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC41}ADC:03_Raw-I,  OUTPUT=BR{PSC41}ADC:03-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC41}ADC:04_Raw-I,  OUTPUT=BR{PSC41}ADC:04-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC41}ADC:05_Raw-I,  OUTPUT=BR{PSC41}ADC:05-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC41}ADC:06_Raw-I,  OUTPUT=BR{PSC41}ADC:06-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC41}ADC:07_Raw-I,  OUTPUT=BR{PSC41}ADC:07-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC41}ADC:08_Raw-I,  OUTPUT=BR{PSC41}ADC:08-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC41}ADC:09_Raw-I,  OUTPUT=BR{PSC41}ADC:09-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC41}ADC:10_Raw-I,  OUTPUT=BR{PSC41}ADC:10-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC41}ADC:11_Raw-I,  OUTPUT=BR{PSC41}ADC:11-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC41}ADC:12_Raw-I,  OUTPUT=BR{PSC41}ADC:12-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC41}ADC:13_Raw-I,  OUTPUT=BR{PSC41}ADC:13-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC41}ADC:14_Raw-I,  OUTPUT=BR{PSC41}ADC:14-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC41}ADC:15_Raw-I,  OUTPUT=BR{PSC41}ADC:15-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC41}ADC:16_Raw-I,  OUTPUT=BR{PSC41}ADC:16-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC41}ADC:17_Raw-I,  OUTPUT=BR{PSC41}ADC:17-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR{PSC41}ADC10k:0_Raw-I,  OUTPUT=BR{PSC41}ADC10k:0_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Average.db",        "INPUT=BR{PSC41}ADC10k:1_Raw-I,  OUTPUT=BR{PSC41}ADC10k:1_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Subtract.db",       "INPUT1=BR{PSC41}ADC10k:0_Raw-I, INPUT2=BR{PSC41}ADC10k:1_Raw-I, OUTPUT=BR{PSC41}ADC10k_Sub-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC41}ADC10k:0_Raw-I,  OUTPUT=BR{PSC41}ADC10k:0_Raw_I_FFT-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC41}ADC10k:1_Raw-I,  OUTPUT=BR{PSC41}ADC10k:1_Raw_I_FFT-I, WF_LENGTH=10150")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC41, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=0, MSGID=81, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC41}DAC:0-SP,         OUTPUT=BR{PSC41}DAC:0_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC41}DAC:0_Raw-SP,     OUTPUT=BR{PSC41}DAC:0_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC41}DAC:0_Raw_tr-SP,  OUTPUT=BR{PSC41}DAC:0_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC41, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=1, MSGID=82, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC41}DAC:1-SP,         OUTPUT=BR{PSC41}DAC:1_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC41}DAC:1_Raw-SP,     OUTPUT=BR{PSC41}DAC:1_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC41}DAC:1_Raw_tr-SP,  OUTPUT=BR{PSC41}DAC:1_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Commands.db",       "PriSys=BR, PS=PSC42")
dbLoadRecords("db/Status.db",         "PriSys=BR, PS=PSC42")
# ADC waveforms (both 10k and 1k)
dbLoadRecords("db/ADCWaveform.db",    "PSy=BR, PS=PSC42, TIMESTAMP=BST-TS{EVR:D3A}Cnt:BRPrev-I, ADC1K_POINTS=1014, ADC10K_POINTS=10150")
# adjusted ADC waveforms are below
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC42}ADC:00_Raw-I,  OUTPUT=BR{PSC42}ADC:00-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC42}ADC:01_Raw-I,  OUTPUT=BR{PSC42}ADC:01-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC42}ADC:02_Raw-I,  OUTPUT=BR{PSC42}ADC:02-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC42}ADC:03_Raw-I,  OUTPUT=BR{PSC42}ADC:03-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC42}ADC:04_Raw-I,  OUTPUT=BR{PSC42}ADC:04-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC42}ADC:05_Raw-I,  OUTPUT=BR{PSC42}ADC:05-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC42}ADC:06_Raw-I,  OUTPUT=BR{PSC42}ADC:06-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC42}ADC:07_Raw-I,  OUTPUT=BR{PSC42}ADC:07-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC42}ADC:08_Raw-I,  OUTPUT=BR{PSC42}ADC:08-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC42}ADC:09_Raw-I,  OUTPUT=BR{PSC42}ADC:09-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC42}ADC:10_Raw-I,  OUTPUT=BR{PSC42}ADC:10-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC42}ADC:11_Raw-I,  OUTPUT=BR{PSC42}ADC:11-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC42}ADC:12_Raw-I,  OUTPUT=BR{PSC42}ADC:12-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC42}ADC:13_Raw-I,  OUTPUT=BR{PSC42}ADC:13-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC42}ADC:14_Raw-I,  OUTPUT=BR{PSC42}ADC:14-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC42}ADC:15_Raw-I,  OUTPUT=BR{PSC42}ADC:15-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC42}ADC:16_Raw-I,  OUTPUT=BR{PSC42}ADC:16-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC42}ADC:17_Raw-I,  OUTPUT=BR{PSC42}ADC:17-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR{PSC42}ADC10k:0_Raw-I,  OUTPUT=BR{PSC42}ADC10k:0_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Average.db",        "INPUT=BR{PSC42}ADC10k:1_Raw-I,  OUTPUT=BR{PSC42}ADC10k:1_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Subtract.db",       "INPUT1=BR{PSC42}ADC10k:0_Raw-I, INPUT2=BR{PSC42}ADC10k:1_Raw-I, OUTPUT=BR{PSC42}ADC10k_Sub-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC42}ADC10k:0_Raw-I,  OUTPUT=BR{PSC42}ADC10k:0_Raw_I_FFT-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC42}ADC10k:1_Raw-I,  OUTPUT=BR{PSC42}ADC10k:1_Raw_I_FFT-I, WF_LENGTH=10150")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC42, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=0, MSGID=81, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC42}DAC:0-SP,         OUTPUT=BR{PSC42}DAC:0_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC42}DAC:0_Raw-SP,     OUTPUT=BR{PSC42}DAC:0_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC42}DAC:0_Raw_tr-SP,  OUTPUT=BR{PSC42}DAC:0_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC42, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=1, MSGID=82, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC42}DAC:1-SP,         OUTPUT=BR{PSC42}DAC:1_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC42}DAC:1_Raw-SP,     OUTPUT=BR{PSC42}DAC:1_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC42}DAC:1_Raw_tr-SP,  OUTPUT=BR{PSC42}DAC:1_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Commands.db",       "PriSys=BR, PS=PSC43")
dbLoadRecords("db/Status.db",         "PriSys=BR, PS=PSC43")
# ADC waveforms (both 10k and 1k)
dbLoadRecords("db/ADCWaveform.db",    "PSy=BR, PS=PSC43, TIMESTAMP=BST-TS{EVR:D3A}Cnt:BRPrev-I, ADC1K_POINTS=1014, ADC10K_POINTS=10150")
# adjusted ADC waveforms are below
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC43}ADC:00_Raw-I,  OUTPUT=BR{PSC43}ADC:00-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC43}ADC:01_Raw-I,  OUTPUT=BR{PSC43}ADC:01-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC43}ADC:02_Raw-I,  OUTPUT=BR{PSC43}ADC:02-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC43}ADC:03_Raw-I,  OUTPUT=BR{PSC43}ADC:03-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC43}ADC:04_Raw-I,  OUTPUT=BR{PSC43}ADC:04-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC43}ADC:05_Raw-I,  OUTPUT=BR{PSC43}ADC:05-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC43}ADC:06_Raw-I,  OUTPUT=BR{PSC43}ADC:06-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC43}ADC:07_Raw-I,  OUTPUT=BR{PSC43}ADC:07-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC43}ADC:08_Raw-I,  OUTPUT=BR{PSC43}ADC:08-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC43}ADC:09_Raw-I,  OUTPUT=BR{PSC43}ADC:09-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC43}ADC:10_Raw-I,  OUTPUT=BR{PSC43}ADC:10-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC43}ADC:11_Raw-I,  OUTPUT=BR{PSC43}ADC:11-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC43}ADC:12_Raw-I,  OUTPUT=BR{PSC43}ADC:12-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC43}ADC:13_Raw-I,  OUTPUT=BR{PSC43}ADC:13-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC43}ADC:14_Raw-I,  OUTPUT=BR{PSC43}ADC:14-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC43}ADC:15_Raw-I,  OUTPUT=BR{PSC43}ADC:15-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC43}ADC:16_Raw-I,  OUTPUT=BR{PSC43}ADC:16-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC43}ADC:17_Raw-I,  OUTPUT=BR{PSC43}ADC:17-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR{PSC43}ADC10k:0_Raw-I,  OUTPUT=BR{PSC43}ADC10k:0_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Average.db",        "INPUT=BR{PSC43}ADC10k:1_Raw-I,  OUTPUT=BR{PSC43}ADC10k:1_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Subtract.db",       "INPUT1=BR{PSC43}ADC10k:0_Raw-I, INPUT2=BR{PSC43}ADC10k:1_Raw-I, OUTPUT=BR{PSC43}ADC10k_Sub-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC43}ADC10k:0_Raw-I,  OUTPUT=BR{PSC43}ADC10k:0_Raw_I_FFT-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC43}ADC10k:1_Raw-I,  OUTPUT=BR{PSC43}ADC10k:1_Raw_I_FFT-I, WF_LENGTH=10150")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC43, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=0, MSGID=81, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC43}DAC:0-SP,         OUTPUT=BR{PSC43}DAC:0_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC43}DAC:0_Raw-SP,     OUTPUT=BR{PSC43}DAC:0_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC43}DAC:0_Raw_tr-SP,  OUTPUT=BR{PSC43}DAC:0_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC43, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=1, MSGID=82, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC43}DAC:1-SP,         OUTPUT=BR{PSC43}DAC:1_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC43}DAC:1_Raw-SP,     OUTPUT=BR{PSC43}DAC:1_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC43}DAC:1_Raw_tr-SP,  OUTPUT=BR{PSC43}DAC:1_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Commands.db",       "PriSys=BR, PS=PSC44")
dbLoadRecords("db/Status.db",         "PriSys=BR, PS=PSC44")
# ADC waveforms (both 10k and 1k)
dbLoadRecords("db/ADCWaveform.db",    "PSy=BR, PS=PSC44, TIMESTAMP=BST-TS{EVR:D3A}Cnt:BRPrev-I, ADC1K_POINTS=1014, ADC10K_POINTS=10150")
# adjusted ADC waveforms are below
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC44}ADC:00_Raw-I,  OUTPUT=BR{PSC44}ADC:00-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC44}ADC:01_Raw-I,  OUTPUT=BR{PSC44}ADC:01-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC44}ADC:02_Raw-I,  OUTPUT=BR{PSC44}ADC:02-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC44}ADC:03_Raw-I,  OUTPUT=BR{PSC44}ADC:03-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC44}ADC:04_Raw-I,  OUTPUT=BR{PSC44}ADC:04-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC44}ADC:05_Raw-I,  OUTPUT=BR{PSC44}ADC:05-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC44}ADC:06_Raw-I,  OUTPUT=BR{PSC44}ADC:06-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC44}ADC:07_Raw-I,  OUTPUT=BR{PSC44}ADC:07-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC44}ADC:08_Raw-I,  OUTPUT=BR{PSC44}ADC:08-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC44}ADC:09_Raw-I,  OUTPUT=BR{PSC44}ADC:09-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC44}ADC:10_Raw-I,  OUTPUT=BR{PSC44}ADC:10-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC44}ADC:11_Raw-I,  OUTPUT=BR{PSC44}ADC:11-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC44}ADC:12_Raw-I,  OUTPUT=BR{PSC44}ADC:12-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC44}ADC:13_Raw-I,  OUTPUT=BR{PSC44}ADC:13-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC44}ADC:14_Raw-I,  OUTPUT=BR{PSC44}ADC:14-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC44}ADC:15_Raw-I,  OUTPUT=BR{PSC44}ADC:15-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC44}ADC:16_Raw-I,  OUTPUT=BR{PSC44}ADC:16-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC44}ADC:17_Raw-I,  OUTPUT=BR{PSC44}ADC:17-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR{PSC44}ADC10k:0_Raw-I,  OUTPUT=BR{PSC44}ADC10k:0_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Average.db",        "INPUT=BR{PSC44}ADC10k:1_Raw-I,  OUTPUT=BR{PSC44}ADC10k:1_Raw_Avg-I, WF_LENGTH=10150")
dbLoadRecords("db/Subtract.db",       "INPUT1=BR{PSC44}ADC10k:0_Raw-I, INPUT2=BR{PSC44}ADC10k:1_Raw-I, OUTPUT=BR{PSC44}ADC10k_Sub-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC44}ADC10k:0_Raw-I,  OUTPUT=BR{PSC44}ADC10k:0_Raw_I_FFT-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC44}ADC10k:1_Raw-I,  OUTPUT=BR{PSC44}ADC10k:1_Raw_I_FFT-I, WF_LENGTH=10150")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC44, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=0, MSGID=81, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC44}DAC:0-SP,         OUTPUT=BR{PSC44}DAC:0_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC44}DAC:0_Raw-SP,     OUTPUT=BR{PSC44}DAC:0_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC44}DAC:0_Raw_tr-SP,  OUTPUT=BR{PSC44}DAC:0_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC44, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=1, MSGID=82, DELTA=BR-PS{}6A_Delta-SP, DELTA_STEPS=BR-PS{}6A_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC44}DAC:1-SP,         OUTPUT=BR{PSC44}DAC:1_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC44}DAC:1_Raw-SP,     OUTPUT=BR{PSC44}DAC:1_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC44}DAC:1_Raw_tr-SP,  OUTPUT=BR{PSC44}DAC:1_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

# PSC17 Chan 0
# BR:DS-PS{6A:CXW2} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:DS-PS{6A:CXW2}I-SP,              OUTPUT=BR{PSC17}DAC:0-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC17}ADC:00-I,    OUTPUT=BR:DS-PS{6A:CXW2}I-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC17}ADC:01-I,    OUTPUT=BR:DS-PS{6A:CXW2}I:DAC-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC17}ADC:02-I,    OUTPUT=BR:DS-PS{6A:CXW2}E:PS-I,      WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:DS-PS{6A:CXW2}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC17}DO:1-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC17}DI:01-Sts,   OUTPUT=BR:DS-PS{6A:CXW2}Sts:PSworks-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:DS-PS{6A:CXW2}I-SP, OUTPUT=BR:DS-PS{6A:CXW2}I-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:DS-PS{6A:CXW2}I-SP-1k, OUTPUT=BR:DS-PS{6A:CXW2}I-SP-1k-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:DS-PS{6A:CXW2}I-SP-1k, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:DS-PS{6A:CXW2}I-I,     OUTPUT=BR:DS-PS{6A:CXW2}I-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:DS-PS{6A:CXW2}I-I,     WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:DS-PS{6A:CXW2}I:DAC-I, OUTPUT=BR:DS-PS{6A:CXW2}I:DAC-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:DS-PS{6A:CXW2}I:DAC-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:DS-PS{6A:CXW2}E:PS-I,  OUTPUT=BR:DS-PS{6A:CXW2}E:PS-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:DS-PS{6A:CXW2}E:PS-I,  WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:DS-PS{6A:CXW2}I-SP, CH_REF=BR:DS-PS{6A:CXW2}I-SP_Ref, CH_TOL=BR:DS-PS{6A:CXW2}I_SP_Tol-SP, CH_ARCH=BR:DS-PS{6A:CXW2}I_SP_Arch-I, CH_DIFFREF=BR:DS-PS{6A:CXW2}I_SP_DiffRef-I, CH_DIFFARCH=BR:DS-PS{6A:CXW2}I_SP_DiffArch-I, CH_FLG=BR:DS-PS{6A:CXW2}I_SP_MonitFlg-Sts, CH_FLGARCH=BR:DS-PS{6A:CXW2}I_SP_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:DS-PS{6A:CXW2}I-SP, CH_REF=BR:DS-PS{6A:CXW2}I-SP_Ref, CH_DIFFREF=BR:DS-PS{6A:CXW2}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:DS-PS{6A:CXW2}I-I, CH_REF=BR:DS-PS{6A:CXW2}I-I_Ref, CH_TOL=BR:DS-PS{6A:CXW2}I_I_Tol-SP, CH_ARCH=BR:DS-PS{6A:CXW2}I_I_Arch-I, CH_DIFFREF=BR:DS-PS{6A:CXW2}I_I_DiffRef-I, CH_DIFFARCH=BR:DS-PS{6A:CXW2}I_I_DiffArch-I, CH_FLG=BR:DS-PS{6A:CXW2}I_I_MonitFlg-Sts, CH_FLGARCH=BR:DS-PS{6A:CXW2}I_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:DS-PS{6A:CXW2}I-I, CH_REF=BR:DS-PS{6A:CXW2}I-I_Ref, CH_DIFFREF=BR:DS-PS{6A:CXW2}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:DS-PS{6A:CXW2}I-I, CH_REF=BR:DS-PS{6A:CXW2}I-SP-1k, CH_DIFFREF=BR:DS-PS{6A:CXW2}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:DS-PS{6A:CXW2}I:DAC-I, CH_REF=BR:DS-PS{6A:CXW2}I:DAC-I_Ref, CH_TOL=BR:DS-PS{6A:CXW2}I:DAC_I_Tol-SP,  CH_ARCH=BR:DS-PS{6A:CXW2}I:DAC_I_Arch-I, CH_DIFFREF=BR:DS-PS{6A:CXW2}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR:DS-PS{6A:CXW2}I:DAC_I_DiffArch-I, CH_FLG=BR:DS-PS{6A:CXW2}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:DS-PS{6A:CXW2}I:DAC_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:DS-PS{6A:CXW2}I:DAC-I, CH_REF=BR:DS-PS{6A:CXW2}I:DAC-I_Ref, CH_DIFFREF=BR:DS-PS{6A:CXW2}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:DS-PS{6A:CXW2}I:DAC-I, CH_REF=BR:DS-PS{6A:CXW2}I-SP-1k, CH_DIFFREF=BR:DS-PS{6A:CXW2}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:DS-PS{6A:CXW2}E:PS-I, CH_REF=BR:DS-PS{6A:CXW2}E:PS-I_Ref, CH_TOL=BR:DS-PS{6A:CXW2}E:PS_I_Tol-SP, CH_ARCH=BR:DS-PS{6A:CXW2}E:PS_I_Arch-I, CH_DIFFREF=BR:DS-PS{6A:CXW2}E:PS_I_DiffRef-I, CH_DIFFARCH=BR:DS-PS{6A:CXW2}E:PS_I_DiffArch-I, CH_FLG=BR:DS-PS{6A:CXW2}E:PS_I_MonitFlg-Sts, CH_FLGARCH=BR:DS-PS{6A:CXW2}E:PS_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:DS-PS{6A:CXW2}E:PS-I, CH_REF=BR:DS-PS{6A:CXW2}E:PS-I_Ref, CH_DIFFREF=BR:DS-PS{6A:CXW2}E:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:DS-PS{6A:CXW2}Cmd:PwrOn-Cmd, CH_REF=BR:DS-PS{6A:CXW2}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:DS-PS{6A:CXW2}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:DS-PS{6A:CXW2}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:DS-PS{6A:CXW2}Cmd:PwrOn_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:DS-PS{6A:CXW2}Cmd:PwrOn-Cmd, CH_REF=BR:DS-PS{6A:CXW2}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:DS-PS{6A:CXW2}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:DS-PS{6A:CXW2}Sts:PSworks-Sts, CH_REF=BR:DS-PS{6A:CXW2}Sts:PSworks-Sts_Ref, CH_ARCH=BR:DS-PS{6A:CXW2}Sts:PSworks_Arch-Sts, CH_FLG=BR:DS-PS{6A:CXW2}Sts:PSworks_MonitFlg-Sts, CH_FLGARCH=BR:DS-PS{6A:CXW2}Sts:PSworks_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:DS-PS{6A:CXW2}Sts:PSworks-Sts, CH_REF=BR:DS-PS{6A:CXW2}Sts:PSworks-Sts_Ref, CH_FLG=BR:DS-PS{6A:CXW2}Sts:PSworks_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")


# PSC17 Chan 1
# BR:A1-PS{6A:CX1} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:A1-PS{6A:CX1}I-SP,              OUTPUT=BR{PSC17}DAC:1-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC17}ADC:08-I,    OUTPUT=BR:A1-PS{6A:CX1}I-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC17}ADC:09-I,    OUTPUT=BR:A1-PS{6A:CX1}I:DAC-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC17}ADC:10-I,    OUTPUT=BR:A1-PS{6A:CX1}E:PS-I,      WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:A1-PS{6A:CX1}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC17}DO:0-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC17}DI:00-Sts,   OUTPUT=BR:A1-PS{6A:CX1}Sts:PSworks-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:A1-PS{6A:CX1}I-SP, OUTPUT=BR:A1-PS{6A:CX1}I-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:A1-PS{6A:CX1}I-SP-1k, OUTPUT=BR:A1-PS{6A:CX1}I-SP-1k-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A1-PS{6A:CX1}I-SP-1k, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A1-PS{6A:CX1}I-I,     OUTPUT=BR:A1-PS{6A:CX1}I-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A1-PS{6A:CX1}I-I,     WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A1-PS{6A:CX1}I:DAC-I, OUTPUT=BR:A1-PS{6A:CX1}I:DAC-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A1-PS{6A:CX1}I:DAC-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A1-PS{6A:CX1}E:PS-I,  OUTPUT=BR:A1-PS{6A:CX1}E:PS-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A1-PS{6A:CX1}E:PS-I,  WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A1-PS{6A:CX1}I-SP, CH_REF=BR:A1-PS{6A:CX1}I-SP_Ref, CH_TOL=BR:A1-PS{6A:CX1}I_SP_Tol-SP, CH_ARCH=BR:A1-PS{6A:CX1}I_SP_Arch-I, CH_DIFFREF=BR:A1-PS{6A:CX1}I_SP_DiffRef-I, CH_DIFFARCH=BR:A1-PS{6A:CX1}I_SP_DiffArch-I, CH_FLG=BR:A1-PS{6A:CX1}I_SP_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:CX1}I_SP_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:CX1}I-SP, CH_REF=BR:A1-PS{6A:CX1}I-SP_Ref, CH_DIFFREF=BR:A1-PS{6A:CX1}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A1-PS{6A:CX1}I-I, CH_REF=BR:A1-PS{6A:CX1}I-I_Ref, CH_TOL=BR:A1-PS{6A:CX1}I_I_Tol-SP, CH_ARCH=BR:A1-PS{6A:CX1}I_I_Arch-I, CH_DIFFREF=BR:A1-PS{6A:CX1}I_I_DiffRef-I, CH_DIFFARCH=BR:A1-PS{6A:CX1}I_I_DiffArch-I, CH_FLG=BR:A1-PS{6A:CX1}I_I_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:CX1}I_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:CX1}I-I, CH_REF=BR:A1-PS{6A:CX1}I-I_Ref, CH_DIFFREF=BR:A1-PS{6A:CX1}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:CX1}I-I, CH_REF=BR:A1-PS{6A:CX1}I-SP-1k, CH_DIFFREF=BR:A1-PS{6A:CX1}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A1-PS{6A:CX1}I:DAC-I, CH_REF=BR:A1-PS{6A:CX1}I:DAC-I_Ref, CH_TOL=BR:A1-PS{6A:CX1}I:DAC_I_Tol-SP,  CH_ARCH=BR:A1-PS{6A:CX1}I:DAC_I_Arch-I, CH_DIFFREF=BR:A1-PS{6A:CX1}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR:A1-PS{6A:CX1}I:DAC_I_DiffArch-I, CH_FLG=BR:A1-PS{6A:CX1}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:CX1}I:DAC_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:CX1}I:DAC-I, CH_REF=BR:A1-PS{6A:CX1}I:DAC-I_Ref, CH_DIFFREF=BR:A1-PS{6A:CX1}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:CX1}I:DAC-I, CH_REF=BR:A1-PS{6A:CX1}I-SP-1k, CH_DIFFREF=BR:A1-PS{6A:CX1}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A1-PS{6A:CX1}E:PS-I, CH_REF=BR:A1-PS{6A:CX1}E:PS-I_Ref, CH_TOL=BR:A1-PS{6A:CX1}E:PS_I_Tol-SP, CH_ARCH=BR:A1-PS{6A:CX1}E:PS_I_Arch-I, CH_DIFFREF=BR:A1-PS{6A:CX1}E:PS_I_DiffRef-I, CH_DIFFARCH=BR:A1-PS{6A:CX1}E:PS_I_DiffArch-I, CH_FLG=BR:A1-PS{6A:CX1}E:PS_I_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:CX1}E:PS_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:CX1}E:PS-I, CH_REF=BR:A1-PS{6A:CX1}E:PS-I_Ref, CH_DIFFREF=BR:A1-PS{6A:CX1}E:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A1-PS{6A:CX1}Cmd:PwrOn-Cmd, CH_REF=BR:A1-PS{6A:CX1}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:A1-PS{6A:CX1}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:A1-PS{6A:CX1}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:CX1}Cmd:PwrOn_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A1-PS{6A:CX1}Cmd:PwrOn-Cmd, CH_REF=BR:A1-PS{6A:CX1}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:A1-PS{6A:CX1}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A1-PS{6A:CX1}Sts:PSworks-Sts, CH_REF=BR:A1-PS{6A:CX1}Sts:PSworks-Sts_Ref, CH_ARCH=BR:A1-PS{6A:CX1}Sts:PSworks_Arch-Sts, CH_FLG=BR:A1-PS{6A:CX1}Sts:PSworks_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:CX1}Sts:PSworks_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A1-PS{6A:CX1}Sts:PSworks-Sts, CH_REF=BR:A1-PS{6A:CX1}Sts:PSworks-Sts_Ref, CH_FLG=BR:A1-PS{6A:CX1}Sts:PSworks_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")


# PSC18 Chan 0
# BR:A1-PS{6A:CX2} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:A1-PS{6A:CX2}I-SP,              OUTPUT=BR{PSC18}DAC:0-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC18}ADC:00-I,    OUTPUT=BR:A1-PS{6A:CX2}I-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC18}ADC:01-I,    OUTPUT=BR:A1-PS{6A:CX2}I:DAC-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC18}ADC:02-I,    OUTPUT=BR:A1-PS{6A:CX2}E:PS-I,      WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:A1-PS{6A:CX2}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC18}DO:1-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC18}DI:01-Sts,   OUTPUT=BR:A1-PS{6A:CX2}Sts:PSworks-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:A1-PS{6A:CX2}I-SP, OUTPUT=BR:A1-PS{6A:CX2}I-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:A1-PS{6A:CX2}I-SP-1k, OUTPUT=BR:A1-PS{6A:CX2}I-SP-1k-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A1-PS{6A:CX2}I-SP-1k, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A1-PS{6A:CX2}I-I,     OUTPUT=BR:A1-PS{6A:CX2}I-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A1-PS{6A:CX2}I-I,     WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A1-PS{6A:CX2}I:DAC-I, OUTPUT=BR:A1-PS{6A:CX2}I:DAC-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A1-PS{6A:CX2}I:DAC-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A1-PS{6A:CX2}E:PS-I,  OUTPUT=BR:A1-PS{6A:CX2}E:PS-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A1-PS{6A:CX2}E:PS-I,  WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A1-PS{6A:CX2}I-SP, CH_REF=BR:A1-PS{6A:CX2}I-SP_Ref, CH_TOL=BR:A1-PS{6A:CX2}I_SP_Tol-SP, CH_ARCH=BR:A1-PS{6A:CX2}I_SP_Arch-I, CH_DIFFREF=BR:A1-PS{6A:CX2}I_SP_DiffRef-I, CH_DIFFARCH=BR:A1-PS{6A:CX2}I_SP_DiffArch-I, CH_FLG=BR:A1-PS{6A:CX2}I_SP_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:CX2}I_SP_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:CX2}I-SP, CH_REF=BR:A1-PS{6A:CX2}I-SP_Ref, CH_DIFFREF=BR:A1-PS{6A:CX2}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A1-PS{6A:CX2}I-I, CH_REF=BR:A1-PS{6A:CX2}I-I_Ref, CH_TOL=BR:A1-PS{6A:CX2}I_I_Tol-SP, CH_ARCH=BR:A1-PS{6A:CX2}I_I_Arch-I, CH_DIFFREF=BR:A1-PS{6A:CX2}I_I_DiffRef-I, CH_DIFFARCH=BR:A1-PS{6A:CX2}I_I_DiffArch-I, CH_FLG=BR:A1-PS{6A:CX2}I_I_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:CX2}I_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:CX2}I-I, CH_REF=BR:A1-PS{6A:CX2}I-I_Ref, CH_DIFFREF=BR:A1-PS{6A:CX2}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:CX2}I-I, CH_REF=BR:A1-PS{6A:CX2}I-SP-1k, CH_DIFFREF=BR:A1-PS{6A:CX2}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A1-PS{6A:CX2}I:DAC-I, CH_REF=BR:A1-PS{6A:CX2}I:DAC-I_Ref, CH_TOL=BR:A1-PS{6A:CX2}I:DAC_I_Tol-SP,  CH_ARCH=BR:A1-PS{6A:CX2}I:DAC_I_Arch-I, CH_DIFFREF=BR:A1-PS{6A:CX2}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR:A1-PS{6A:CX2}I:DAC_I_DiffArch-I, CH_FLG=BR:A1-PS{6A:CX2}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:CX2}I:DAC_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:CX2}I:DAC-I, CH_REF=BR:A1-PS{6A:CX2}I:DAC-I_Ref, CH_DIFFREF=BR:A1-PS{6A:CX2}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:CX2}I:DAC-I, CH_REF=BR:A1-PS{6A:CX2}I-SP-1k, CH_DIFFREF=BR:A1-PS{6A:CX2}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A1-PS{6A:CX2}E:PS-I, CH_REF=BR:A1-PS{6A:CX2}E:PS-I_Ref, CH_TOL=BR:A1-PS{6A:CX2}E:PS_I_Tol-SP, CH_ARCH=BR:A1-PS{6A:CX2}E:PS_I_Arch-I, CH_DIFFREF=BR:A1-PS{6A:CX2}E:PS_I_DiffRef-I, CH_DIFFARCH=BR:A1-PS{6A:CX2}E:PS_I_DiffArch-I, CH_FLG=BR:A1-PS{6A:CX2}E:PS_I_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:CX2}E:PS_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:CX2}E:PS-I, CH_REF=BR:A1-PS{6A:CX2}E:PS-I_Ref, CH_DIFFREF=BR:A1-PS{6A:CX2}E:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A1-PS{6A:CX2}Cmd:PwrOn-Cmd, CH_REF=BR:A1-PS{6A:CX2}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:A1-PS{6A:CX2}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:A1-PS{6A:CX2}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:CX2}Cmd:PwrOn_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A1-PS{6A:CX2}Cmd:PwrOn-Cmd, CH_REF=BR:A1-PS{6A:CX2}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:A1-PS{6A:CX2}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A1-PS{6A:CX2}Sts:PSworks-Sts, CH_REF=BR:A1-PS{6A:CX2}Sts:PSworks-Sts_Ref, CH_ARCH=BR:A1-PS{6A:CX2}Sts:PSworks_Arch-Sts, CH_FLG=BR:A1-PS{6A:CX2}Sts:PSworks_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:CX2}Sts:PSworks_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A1-PS{6A:CX2}Sts:PSworks-Sts, CH_REF=BR:A1-PS{6A:CX2}Sts:PSworks-Sts_Ref, CH_FLG=BR:A1-PS{6A:CX2}Sts:PSworks_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")


# PSC18 Chan 1
# BR:A1-PS{6A:CX3} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:A1-PS{6A:CX3}I-SP,              OUTPUT=BR{PSC18}DAC:1-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC18}ADC:08-I,    OUTPUT=BR:A1-PS{6A:CX3}I-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC18}ADC:09-I,    OUTPUT=BR:A1-PS{6A:CX3}I:DAC-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC18}ADC:10-I,    OUTPUT=BR:A1-PS{6A:CX3}E:PS-I,      WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:A1-PS{6A:CX3}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC18}DO:0-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC18}DI:00-Sts,   OUTPUT=BR:A1-PS{6A:CX3}Sts:PSworks-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:A1-PS{6A:CX3}I-SP, OUTPUT=BR:A1-PS{6A:CX3}I-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:A1-PS{6A:CX3}I-SP-1k, OUTPUT=BR:A1-PS{6A:CX3}I-SP-1k-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A1-PS{6A:CX3}I-SP-1k, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A1-PS{6A:CX3}I-I,     OUTPUT=BR:A1-PS{6A:CX3}I-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A1-PS{6A:CX3}I-I,     WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A1-PS{6A:CX3}I:DAC-I, OUTPUT=BR:A1-PS{6A:CX3}I:DAC-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A1-PS{6A:CX3}I:DAC-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A1-PS{6A:CX3}E:PS-I,  OUTPUT=BR:A1-PS{6A:CX3}E:PS-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A1-PS{6A:CX3}E:PS-I,  WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A1-PS{6A:CX3}I-SP, CH_REF=BR:A1-PS{6A:CX3}I-SP_Ref, CH_TOL=BR:A1-PS{6A:CX3}I_SP_Tol-SP, CH_ARCH=BR:A1-PS{6A:CX3}I_SP_Arch-I, CH_DIFFREF=BR:A1-PS{6A:CX3}I_SP_DiffRef-I, CH_DIFFARCH=BR:A1-PS{6A:CX3}I_SP_DiffArch-I, CH_FLG=BR:A1-PS{6A:CX3}I_SP_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:CX3}I_SP_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:CX3}I-SP, CH_REF=BR:A1-PS{6A:CX3}I-SP_Ref, CH_DIFFREF=BR:A1-PS{6A:CX3}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A1-PS{6A:CX3}I-I, CH_REF=BR:A1-PS{6A:CX3}I-I_Ref, CH_TOL=BR:A1-PS{6A:CX3}I_I_Tol-SP, CH_ARCH=BR:A1-PS{6A:CX3}I_I_Arch-I, CH_DIFFREF=BR:A1-PS{6A:CX3}I_I_DiffRef-I, CH_DIFFARCH=BR:A1-PS{6A:CX3}I_I_DiffArch-I, CH_FLG=BR:A1-PS{6A:CX3}I_I_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:CX3}I_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:CX3}I-I, CH_REF=BR:A1-PS{6A:CX3}I-I_Ref, CH_DIFFREF=BR:A1-PS{6A:CX3}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:CX3}I-I, CH_REF=BR:A1-PS{6A:CX3}I-SP-1k, CH_DIFFREF=BR:A1-PS{6A:CX3}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A1-PS{6A:CX3}I:DAC-I, CH_REF=BR:A1-PS{6A:CX3}I:DAC-I_Ref, CH_TOL=BR:A1-PS{6A:CX3}I:DAC_I_Tol-SP,  CH_ARCH=BR:A1-PS{6A:CX3}I:DAC_I_Arch-I, CH_DIFFREF=BR:A1-PS{6A:CX3}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR:A1-PS{6A:CX3}I:DAC_I_DiffArch-I, CH_FLG=BR:A1-PS{6A:CX3}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:CX3}I:DAC_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:CX3}I:DAC-I, CH_REF=BR:A1-PS{6A:CX3}I:DAC-I_Ref, CH_DIFFREF=BR:A1-PS{6A:CX3}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:CX3}I:DAC-I, CH_REF=BR:A1-PS{6A:CX3}I-SP-1k, CH_DIFFREF=BR:A1-PS{6A:CX3}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A1-PS{6A:CX3}E:PS-I, CH_REF=BR:A1-PS{6A:CX3}E:PS-I_Ref, CH_TOL=BR:A1-PS{6A:CX3}E:PS_I_Tol-SP, CH_ARCH=BR:A1-PS{6A:CX3}E:PS_I_Arch-I, CH_DIFFREF=BR:A1-PS{6A:CX3}E:PS_I_DiffRef-I, CH_DIFFARCH=BR:A1-PS{6A:CX3}E:PS_I_DiffArch-I, CH_FLG=BR:A1-PS{6A:CX3}E:PS_I_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:CX3}E:PS_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:CX3}E:PS-I, CH_REF=BR:A1-PS{6A:CX3}E:PS-I_Ref, CH_DIFFREF=BR:A1-PS{6A:CX3}E:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A1-PS{6A:CX3}Cmd:PwrOn-Cmd, CH_REF=BR:A1-PS{6A:CX3}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:A1-PS{6A:CX3}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:A1-PS{6A:CX3}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:CX3}Cmd:PwrOn_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A1-PS{6A:CX3}Cmd:PwrOn-Cmd, CH_REF=BR:A1-PS{6A:CX3}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:A1-PS{6A:CX3}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A1-PS{6A:CX3}Sts:PSworks-Sts, CH_REF=BR:A1-PS{6A:CX3}Sts:PSworks-Sts_Ref, CH_ARCH=BR:A1-PS{6A:CX3}Sts:PSworks_Arch-Sts, CH_FLG=BR:A1-PS{6A:CX3}Sts:PSworks_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:CX3}Sts:PSworks_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A1-PS{6A:CX3}Sts:PSworks-Sts, CH_REF=BR:A1-PS{6A:CX3}Sts:PSworks-Sts_Ref, CH_FLG=BR:A1-PS{6A:CX3}Sts:PSworks_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")


# PSC19 Chan 0
# BR:DS-PS{6A:CXW1} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:DS-PS{6A:CXW1}I-SP,              OUTPUT=BR{PSC19}DAC:0-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC19}ADC:00-I,    OUTPUT=BR:DS-PS{6A:CXW1}I-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC19}ADC:01-I,    OUTPUT=BR:DS-PS{6A:CXW1}I:DAC-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC19}ADC:02-I,    OUTPUT=BR:DS-PS{6A:CXW1}E:PS-I,      WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:DS-PS{6A:CXW1}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC19}DO:1-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC19}DI:01-Sts,   OUTPUT=BR:DS-PS{6A:CXW1}Sts:PSworks-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:DS-PS{6A:CXW1}I-SP, OUTPUT=BR:DS-PS{6A:CXW1}I-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:DS-PS{6A:CXW1}I-SP-1k, OUTPUT=BR:DS-PS{6A:CXW1}I-SP-1k-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:DS-PS{6A:CXW1}I-SP-1k, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:DS-PS{6A:CXW1}I-I,     OUTPUT=BR:DS-PS{6A:CXW1}I-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:DS-PS{6A:CXW1}I-I,     WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:DS-PS{6A:CXW1}I:DAC-I, OUTPUT=BR:DS-PS{6A:CXW1}I:DAC-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:DS-PS{6A:CXW1}I:DAC-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:DS-PS{6A:CXW1}E:PS-I,  OUTPUT=BR:DS-PS{6A:CXW1}E:PS-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:DS-PS{6A:CXW1}E:PS-I,  WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:DS-PS{6A:CXW1}I-SP, CH_REF=BR:DS-PS{6A:CXW1}I-SP_Ref, CH_TOL=BR:DS-PS{6A:CXW1}I_SP_Tol-SP, CH_ARCH=BR:DS-PS{6A:CXW1}I_SP_Arch-I, CH_DIFFREF=BR:DS-PS{6A:CXW1}I_SP_DiffRef-I, CH_DIFFARCH=BR:DS-PS{6A:CXW1}I_SP_DiffArch-I, CH_FLG=BR:DS-PS{6A:CXW1}I_SP_MonitFlg-Sts, CH_FLGARCH=BR:DS-PS{6A:CXW1}I_SP_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:DS-PS{6A:CXW1}I-SP, CH_REF=BR:DS-PS{6A:CXW1}I-SP_Ref, CH_DIFFREF=BR:DS-PS{6A:CXW1}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:DS-PS{6A:CXW1}I-I, CH_REF=BR:DS-PS{6A:CXW1}I-I_Ref, CH_TOL=BR:DS-PS{6A:CXW1}I_I_Tol-SP, CH_ARCH=BR:DS-PS{6A:CXW1}I_I_Arch-I, CH_DIFFREF=BR:DS-PS{6A:CXW1}I_I_DiffRef-I, CH_DIFFARCH=BR:DS-PS{6A:CXW1}I_I_DiffArch-I, CH_FLG=BR:DS-PS{6A:CXW1}I_I_MonitFlg-Sts, CH_FLGARCH=BR:DS-PS{6A:CXW1}I_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:DS-PS{6A:CXW1}I-I, CH_REF=BR:DS-PS{6A:CXW1}I-I_Ref, CH_DIFFREF=BR:DS-PS{6A:CXW1}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:DS-PS{6A:CXW1}I-I, CH_REF=BR:DS-PS{6A:CXW1}I-SP-1k, CH_DIFFREF=BR:DS-PS{6A:CXW1}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:DS-PS{6A:CXW1}I:DAC-I, CH_REF=BR:DS-PS{6A:CXW1}I:DAC-I_Ref, CH_TOL=BR:DS-PS{6A:CXW1}I:DAC_I_Tol-SP,  CH_ARCH=BR:DS-PS{6A:CXW1}I:DAC_I_Arch-I, CH_DIFFREF=BR:DS-PS{6A:CXW1}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR:DS-PS{6A:CXW1}I:DAC_I_DiffArch-I, CH_FLG=BR:DS-PS{6A:CXW1}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:DS-PS{6A:CXW1}I:DAC_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:DS-PS{6A:CXW1}I:DAC-I, CH_REF=BR:DS-PS{6A:CXW1}I:DAC-I_Ref, CH_DIFFREF=BR:DS-PS{6A:CXW1}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:DS-PS{6A:CXW1}I:DAC-I, CH_REF=BR:DS-PS{6A:CXW1}I-SP-1k, CH_DIFFREF=BR:DS-PS{6A:CXW1}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:DS-PS{6A:CXW1}E:PS-I, CH_REF=BR:DS-PS{6A:CXW1}E:PS-I_Ref, CH_TOL=BR:DS-PS{6A:CXW1}E:PS_I_Tol-SP, CH_ARCH=BR:DS-PS{6A:CXW1}E:PS_I_Arch-I, CH_DIFFREF=BR:DS-PS{6A:CXW1}E:PS_I_DiffRef-I, CH_DIFFARCH=BR:DS-PS{6A:CXW1}E:PS_I_DiffArch-I, CH_FLG=BR:DS-PS{6A:CXW1}E:PS_I_MonitFlg-Sts, CH_FLGARCH=BR:DS-PS{6A:CXW1}E:PS_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:DS-PS{6A:CXW1}E:PS-I, CH_REF=BR:DS-PS{6A:CXW1}E:PS-I_Ref, CH_DIFFREF=BR:DS-PS{6A:CXW1}E:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:DS-PS{6A:CXW1}Cmd:PwrOn-Cmd, CH_REF=BR:DS-PS{6A:CXW1}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:DS-PS{6A:CXW1}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:DS-PS{6A:CXW1}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:DS-PS{6A:CXW1}Cmd:PwrOn_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:DS-PS{6A:CXW1}Cmd:PwrOn-Cmd, CH_REF=BR:DS-PS{6A:CXW1}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:DS-PS{6A:CXW1}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:DS-PS{6A:CXW1}Sts:PSworks-Sts, CH_REF=BR:DS-PS{6A:CXW1}Sts:PSworks-Sts_Ref, CH_ARCH=BR:DS-PS{6A:CXW1}Sts:PSworks_Arch-Sts, CH_FLG=BR:DS-PS{6A:CXW1}Sts:PSworks_MonitFlg-Sts, CH_FLGARCH=BR:DS-PS{6A:CXW1}Sts:PSworks_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:DS-PS{6A:CXW1}Sts:PSworks-Sts, CH_REF=BR:DS-PS{6A:CXW1}Sts:PSworks-Sts_Ref, CH_FLG=BR:DS-PS{6A:CXW1}Sts:PSworks_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")


# PSC19 Chan 1
# BR:A1-PS{6A:SF1} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:A1-PS{6A:SF1}I-SP,              OUTPUT=BR{PSC19}DAC:1-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC19}ADC:08-I,    OUTPUT=BR:A1-PS{6A:SF1}I-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC19}ADC:09-I,    OUTPUT=BR:A1-PS{6A:SF1}I:DAC-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC19}ADC:10-I,    OUTPUT=BR:A1-PS{6A:SF1}E:PS-I,      WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:A1-PS{6A:SF1}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC19}DO:0-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC19}DI:00-Sts,   OUTPUT=BR:A1-PS{6A:SF1}Sts:PSworks-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:A1-PS{6A:SF1}I-SP, OUTPUT=BR:A1-PS{6A:SF1}I-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:A1-PS{6A:SF1}I-SP-1k, OUTPUT=BR:A1-PS{6A:SF1}I-SP-1k-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A1-PS{6A:SF1}I-SP-1k, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A1-PS{6A:SF1}I-I,     OUTPUT=BR:A1-PS{6A:SF1}I-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A1-PS{6A:SF1}I-I,     WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A1-PS{6A:SF1}I:DAC-I, OUTPUT=BR:A1-PS{6A:SF1}I:DAC-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A1-PS{6A:SF1}I:DAC-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A1-PS{6A:SF1}E:PS-I,  OUTPUT=BR:A1-PS{6A:SF1}E:PS-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A1-PS{6A:SF1}E:PS-I,  WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A1-PS{6A:SF1}I-SP, CH_REF=BR:A1-PS{6A:SF1}I-SP_Ref, CH_TOL=BR:A1-PS{6A:SF1}I_SP_Tol-SP, CH_ARCH=BR:A1-PS{6A:SF1}I_SP_Arch-I, CH_DIFFREF=BR:A1-PS{6A:SF1}I_SP_DiffRef-I, CH_DIFFARCH=BR:A1-PS{6A:SF1}I_SP_DiffArch-I, CH_FLG=BR:A1-PS{6A:SF1}I_SP_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:SF1}I_SP_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:SF1}I-SP, CH_REF=BR:A1-PS{6A:SF1}I-SP_Ref, CH_DIFFREF=BR:A1-PS{6A:SF1}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A1-PS{6A:SF1}I-I, CH_REF=BR:A1-PS{6A:SF1}I-I_Ref, CH_TOL=BR:A1-PS{6A:SF1}I_I_Tol-SP, CH_ARCH=BR:A1-PS{6A:SF1}I_I_Arch-I, CH_DIFFREF=BR:A1-PS{6A:SF1}I_I_DiffRef-I, CH_DIFFARCH=BR:A1-PS{6A:SF1}I_I_DiffArch-I, CH_FLG=BR:A1-PS{6A:SF1}I_I_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:SF1}I_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:SF1}I-I, CH_REF=BR:A1-PS{6A:SF1}I-I_Ref, CH_DIFFREF=BR:A1-PS{6A:SF1}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:SF1}I-I, CH_REF=BR:A1-PS{6A:SF1}I-SP-1k, CH_DIFFREF=BR:A1-PS{6A:SF1}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A1-PS{6A:SF1}I:DAC-I, CH_REF=BR:A1-PS{6A:SF1}I:DAC-I_Ref, CH_TOL=BR:A1-PS{6A:SF1}I:DAC_I_Tol-SP,  CH_ARCH=BR:A1-PS{6A:SF1}I:DAC_I_Arch-I, CH_DIFFREF=BR:A1-PS{6A:SF1}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR:A1-PS{6A:SF1}I:DAC_I_DiffArch-I, CH_FLG=BR:A1-PS{6A:SF1}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:SF1}I:DAC_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:SF1}I:DAC-I, CH_REF=BR:A1-PS{6A:SF1}I:DAC-I_Ref, CH_DIFFREF=BR:A1-PS{6A:SF1}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:SF1}I:DAC-I, CH_REF=BR:A1-PS{6A:SF1}I-SP-1k, CH_DIFFREF=BR:A1-PS{6A:SF1}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A1-PS{6A:SF1}E:PS-I, CH_REF=BR:A1-PS{6A:SF1}E:PS-I_Ref, CH_TOL=BR:A1-PS{6A:SF1}E:PS_I_Tol-SP, CH_ARCH=BR:A1-PS{6A:SF1}E:PS_I_Arch-I, CH_DIFFREF=BR:A1-PS{6A:SF1}E:PS_I_DiffRef-I, CH_DIFFARCH=BR:A1-PS{6A:SF1}E:PS_I_DiffArch-I, CH_FLG=BR:A1-PS{6A:SF1}E:PS_I_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:SF1}E:PS_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:SF1}E:PS-I, CH_REF=BR:A1-PS{6A:SF1}E:PS-I_Ref, CH_DIFFREF=BR:A1-PS{6A:SF1}E:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A1-PS{6A:SF1}Cmd:PwrOn-Cmd, CH_REF=BR:A1-PS{6A:SF1}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:A1-PS{6A:SF1}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:A1-PS{6A:SF1}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:SF1}Cmd:PwrOn_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A1-PS{6A:SF1}Cmd:PwrOn-Cmd, CH_REF=BR:A1-PS{6A:SF1}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:A1-PS{6A:SF1}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A1-PS{6A:SF1}Sts:PSworks-Sts, CH_REF=BR:A1-PS{6A:SF1}Sts:PSworks-Sts_Ref, CH_ARCH=BR:A1-PS{6A:SF1}Sts:PSworks_Arch-Sts, CH_FLG=BR:A1-PS{6A:SF1}Sts:PSworks_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:SF1}Sts:PSworks_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A1-PS{6A:SF1}Sts:PSworks-Sts, CH_REF=BR:A1-PS{6A:SF1}Sts:PSworks-Sts_Ref, CH_FLG=BR:A1-PS{6A:SF1}Sts:PSworks_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")


# PSC20 Chan 0
# BR:A1-PS{6A:CY1} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:A1-PS{6A:CY1}I-SP,              OUTPUT=BR{PSC20}DAC:0-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC20}ADC:00-I,    OUTPUT=BR:A1-PS{6A:CY1}I-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC20}ADC:01-I,    OUTPUT=BR:A1-PS{6A:CY1}I:DAC-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC20}ADC:02-I,    OUTPUT=BR:A1-PS{6A:CY1}E:PS-I,      WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:A1-PS{6A:CY1}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC20}DO:1-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC20}DI:01-Sts,   OUTPUT=BR:A1-PS{6A:CY1}Sts:PSworks-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:A1-PS{6A:CY1}I-SP, OUTPUT=BR:A1-PS{6A:CY1}I-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:A1-PS{6A:CY1}I-SP-1k, OUTPUT=BR:A1-PS{6A:CY1}I-SP-1k-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A1-PS{6A:CY1}I-SP-1k, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A1-PS{6A:CY1}I-I,     OUTPUT=BR:A1-PS{6A:CY1}I-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A1-PS{6A:CY1}I-I,     WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A1-PS{6A:CY1}I:DAC-I, OUTPUT=BR:A1-PS{6A:CY1}I:DAC-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A1-PS{6A:CY1}I:DAC-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A1-PS{6A:CY1}E:PS-I,  OUTPUT=BR:A1-PS{6A:CY1}E:PS-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A1-PS{6A:CY1}E:PS-I,  WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A1-PS{6A:CY1}I-SP, CH_REF=BR:A1-PS{6A:CY1}I-SP_Ref, CH_TOL=BR:A1-PS{6A:CY1}I_SP_Tol-SP, CH_ARCH=BR:A1-PS{6A:CY1}I_SP_Arch-I, CH_DIFFREF=BR:A1-PS{6A:CY1}I_SP_DiffRef-I, CH_DIFFARCH=BR:A1-PS{6A:CY1}I_SP_DiffArch-I, CH_FLG=BR:A1-PS{6A:CY1}I_SP_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:CY1}I_SP_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:CY1}I-SP, CH_REF=BR:A1-PS{6A:CY1}I-SP_Ref, CH_DIFFREF=BR:A1-PS{6A:CY1}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A1-PS{6A:CY1}I-I, CH_REF=BR:A1-PS{6A:CY1}I-I_Ref, CH_TOL=BR:A1-PS{6A:CY1}I_I_Tol-SP, CH_ARCH=BR:A1-PS{6A:CY1}I_I_Arch-I, CH_DIFFREF=BR:A1-PS{6A:CY1}I_I_DiffRef-I, CH_DIFFARCH=BR:A1-PS{6A:CY1}I_I_DiffArch-I, CH_FLG=BR:A1-PS{6A:CY1}I_I_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:CY1}I_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:CY1}I-I, CH_REF=BR:A1-PS{6A:CY1}I-I_Ref, CH_DIFFREF=BR:A1-PS{6A:CY1}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:CY1}I-I, CH_REF=BR:A1-PS{6A:CY1}I-SP-1k, CH_DIFFREF=BR:A1-PS{6A:CY1}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A1-PS{6A:CY1}I:DAC-I, CH_REF=BR:A1-PS{6A:CY1}I:DAC-I_Ref, CH_TOL=BR:A1-PS{6A:CY1}I:DAC_I_Tol-SP,  CH_ARCH=BR:A1-PS{6A:CY1}I:DAC_I_Arch-I, CH_DIFFREF=BR:A1-PS{6A:CY1}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR:A1-PS{6A:CY1}I:DAC_I_DiffArch-I, CH_FLG=BR:A1-PS{6A:CY1}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:CY1}I:DAC_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:CY1}I:DAC-I, CH_REF=BR:A1-PS{6A:CY1}I:DAC-I_Ref, CH_DIFFREF=BR:A1-PS{6A:CY1}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:CY1}I:DAC-I, CH_REF=BR:A1-PS{6A:CY1}I-SP-1k, CH_DIFFREF=BR:A1-PS{6A:CY1}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A1-PS{6A:CY1}E:PS-I, CH_REF=BR:A1-PS{6A:CY1}E:PS-I_Ref, CH_TOL=BR:A1-PS{6A:CY1}E:PS_I_Tol-SP, CH_ARCH=BR:A1-PS{6A:CY1}E:PS_I_Arch-I, CH_DIFFREF=BR:A1-PS{6A:CY1}E:PS_I_DiffRef-I, CH_DIFFARCH=BR:A1-PS{6A:CY1}E:PS_I_DiffArch-I, CH_FLG=BR:A1-PS{6A:CY1}E:PS_I_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:CY1}E:PS_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:CY1}E:PS-I, CH_REF=BR:A1-PS{6A:CY1}E:PS-I_Ref, CH_DIFFREF=BR:A1-PS{6A:CY1}E:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A1-PS{6A:CY1}Cmd:PwrOn-Cmd, CH_REF=BR:A1-PS{6A:CY1}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:A1-PS{6A:CY1}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:A1-PS{6A:CY1}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:CY1}Cmd:PwrOn_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A1-PS{6A:CY1}Cmd:PwrOn-Cmd, CH_REF=BR:A1-PS{6A:CY1}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:A1-PS{6A:CY1}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A1-PS{6A:CY1}Sts:PSworks-Sts, CH_REF=BR:A1-PS{6A:CY1}Sts:PSworks-Sts_Ref, CH_ARCH=BR:A1-PS{6A:CY1}Sts:PSworks_Arch-Sts, CH_FLG=BR:A1-PS{6A:CY1}Sts:PSworks_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:CY1}Sts:PSworks_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A1-PS{6A:CY1}Sts:PSworks-Sts, CH_REF=BR:A1-PS{6A:CY1}Sts:PSworks-Sts_Ref, CH_FLG=BR:A1-PS{6A:CY1}Sts:PSworks_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")


# PSC20 Chan 1
# BR:A1-PS{6A:CY2} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:A1-PS{6A:CY2}I-SP,              OUTPUT=BR{PSC20}DAC:1-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC20}ADC:08-I,    OUTPUT=BR:A1-PS{6A:CY2}I-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC20}ADC:09-I,    OUTPUT=BR:A1-PS{6A:CY2}I:DAC-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC20}ADC:10-I,    OUTPUT=BR:A1-PS{6A:CY2}E:PS-I,      WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:A1-PS{6A:CY2}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC20}DO:0-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC20}DI:00-Sts,   OUTPUT=BR:A1-PS{6A:CY2}Sts:PSworks-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:A1-PS{6A:CY2}I-SP, OUTPUT=BR:A1-PS{6A:CY2}I-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:A1-PS{6A:CY2}I-SP-1k, OUTPUT=BR:A1-PS{6A:CY2}I-SP-1k-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A1-PS{6A:CY2}I-SP-1k, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A1-PS{6A:CY2}I-I,     OUTPUT=BR:A1-PS{6A:CY2}I-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A1-PS{6A:CY2}I-I,     WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A1-PS{6A:CY2}I:DAC-I, OUTPUT=BR:A1-PS{6A:CY2}I:DAC-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A1-PS{6A:CY2}I:DAC-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A1-PS{6A:CY2}E:PS-I,  OUTPUT=BR:A1-PS{6A:CY2}E:PS-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A1-PS{6A:CY2}E:PS-I,  WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A1-PS{6A:CY2}I-SP, CH_REF=BR:A1-PS{6A:CY2}I-SP_Ref, CH_TOL=BR:A1-PS{6A:CY2}I_SP_Tol-SP, CH_ARCH=BR:A1-PS{6A:CY2}I_SP_Arch-I, CH_DIFFREF=BR:A1-PS{6A:CY2}I_SP_DiffRef-I, CH_DIFFARCH=BR:A1-PS{6A:CY2}I_SP_DiffArch-I, CH_FLG=BR:A1-PS{6A:CY2}I_SP_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:CY2}I_SP_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:CY2}I-SP, CH_REF=BR:A1-PS{6A:CY2}I-SP_Ref, CH_DIFFREF=BR:A1-PS{6A:CY2}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A1-PS{6A:CY2}I-I, CH_REF=BR:A1-PS{6A:CY2}I-I_Ref, CH_TOL=BR:A1-PS{6A:CY2}I_I_Tol-SP, CH_ARCH=BR:A1-PS{6A:CY2}I_I_Arch-I, CH_DIFFREF=BR:A1-PS{6A:CY2}I_I_DiffRef-I, CH_DIFFARCH=BR:A1-PS{6A:CY2}I_I_DiffArch-I, CH_FLG=BR:A1-PS{6A:CY2}I_I_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:CY2}I_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:CY2}I-I, CH_REF=BR:A1-PS{6A:CY2}I-I_Ref, CH_DIFFREF=BR:A1-PS{6A:CY2}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:CY2}I-I, CH_REF=BR:A1-PS{6A:CY2}I-SP-1k, CH_DIFFREF=BR:A1-PS{6A:CY2}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A1-PS{6A:CY2}I:DAC-I, CH_REF=BR:A1-PS{6A:CY2}I:DAC-I_Ref, CH_TOL=BR:A1-PS{6A:CY2}I:DAC_I_Tol-SP,  CH_ARCH=BR:A1-PS{6A:CY2}I:DAC_I_Arch-I, CH_DIFFREF=BR:A1-PS{6A:CY2}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR:A1-PS{6A:CY2}I:DAC_I_DiffArch-I, CH_FLG=BR:A1-PS{6A:CY2}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:CY2}I:DAC_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:CY2}I:DAC-I, CH_REF=BR:A1-PS{6A:CY2}I:DAC-I_Ref, CH_DIFFREF=BR:A1-PS{6A:CY2}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:CY2}I:DAC-I, CH_REF=BR:A1-PS{6A:CY2}I-SP-1k, CH_DIFFREF=BR:A1-PS{6A:CY2}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A1-PS{6A:CY2}E:PS-I, CH_REF=BR:A1-PS{6A:CY2}E:PS-I_Ref, CH_TOL=BR:A1-PS{6A:CY2}E:PS_I_Tol-SP, CH_ARCH=BR:A1-PS{6A:CY2}E:PS_I_Arch-I, CH_DIFFREF=BR:A1-PS{6A:CY2}E:PS_I_DiffRef-I, CH_DIFFARCH=BR:A1-PS{6A:CY2}E:PS_I_DiffArch-I, CH_FLG=BR:A1-PS{6A:CY2}E:PS_I_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:CY2}E:PS_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:CY2}E:PS-I, CH_REF=BR:A1-PS{6A:CY2}E:PS-I_Ref, CH_DIFFREF=BR:A1-PS{6A:CY2}E:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A1-PS{6A:CY2}Cmd:PwrOn-Cmd, CH_REF=BR:A1-PS{6A:CY2}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:A1-PS{6A:CY2}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:A1-PS{6A:CY2}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:CY2}Cmd:PwrOn_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A1-PS{6A:CY2}Cmd:PwrOn-Cmd, CH_REF=BR:A1-PS{6A:CY2}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:A1-PS{6A:CY2}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A1-PS{6A:CY2}Sts:PSworks-Sts, CH_REF=BR:A1-PS{6A:CY2}Sts:PSworks-Sts_Ref, CH_ARCH=BR:A1-PS{6A:CY2}Sts:PSworks_Arch-Sts, CH_FLG=BR:A1-PS{6A:CY2}Sts:PSworks_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:CY2}Sts:PSworks_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A1-PS{6A:CY2}Sts:PSworks-Sts, CH_REF=BR:A1-PS{6A:CY2}Sts:PSworks-Sts_Ref, CH_FLG=BR:A1-PS{6A:CY2}Sts:PSworks_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")


# PSC21 Chan 0
# BR:A1-PS{6A:CY3} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:A1-PS{6A:CY3}I-SP,              OUTPUT=BR{PSC21}DAC:0-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC21}ADC:00-I,    OUTPUT=BR:A1-PS{6A:CY3}I-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC21}ADC:01-I,    OUTPUT=BR:A1-PS{6A:CY3}I:DAC-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC21}ADC:02-I,    OUTPUT=BR:A1-PS{6A:CY3}E:PS-I,      WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:A1-PS{6A:CY3}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC21}DO:1-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC21}DI:01-Sts,   OUTPUT=BR:A1-PS{6A:CY3}Sts:PSworks-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:A1-PS{6A:CY3}I-SP, OUTPUT=BR:A1-PS{6A:CY3}I-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:A1-PS{6A:CY3}I-SP-1k, OUTPUT=BR:A1-PS{6A:CY3}I-SP-1k-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A1-PS{6A:CY3}I-SP-1k, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A1-PS{6A:CY3}I-I,     OUTPUT=BR:A1-PS{6A:CY3}I-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A1-PS{6A:CY3}I-I,     WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A1-PS{6A:CY3}I:DAC-I, OUTPUT=BR:A1-PS{6A:CY3}I:DAC-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A1-PS{6A:CY3}I:DAC-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A1-PS{6A:CY3}E:PS-I,  OUTPUT=BR:A1-PS{6A:CY3}E:PS-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A1-PS{6A:CY3}E:PS-I,  WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A1-PS{6A:CY3}I-SP, CH_REF=BR:A1-PS{6A:CY3}I-SP_Ref, CH_TOL=BR:A1-PS{6A:CY3}I_SP_Tol-SP, CH_ARCH=BR:A1-PS{6A:CY3}I_SP_Arch-I, CH_DIFFREF=BR:A1-PS{6A:CY3}I_SP_DiffRef-I, CH_DIFFARCH=BR:A1-PS{6A:CY3}I_SP_DiffArch-I, CH_FLG=BR:A1-PS{6A:CY3}I_SP_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:CY3}I_SP_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:CY3}I-SP, CH_REF=BR:A1-PS{6A:CY3}I-SP_Ref, CH_DIFFREF=BR:A1-PS{6A:CY3}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A1-PS{6A:CY3}I-I, CH_REF=BR:A1-PS{6A:CY3}I-I_Ref, CH_TOL=BR:A1-PS{6A:CY3}I_I_Tol-SP, CH_ARCH=BR:A1-PS{6A:CY3}I_I_Arch-I, CH_DIFFREF=BR:A1-PS{6A:CY3}I_I_DiffRef-I, CH_DIFFARCH=BR:A1-PS{6A:CY3}I_I_DiffArch-I, CH_FLG=BR:A1-PS{6A:CY3}I_I_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:CY3}I_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:CY3}I-I, CH_REF=BR:A1-PS{6A:CY3}I-I_Ref, CH_DIFFREF=BR:A1-PS{6A:CY3}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:CY3}I-I, CH_REF=BR:A1-PS{6A:CY3}I-SP-1k, CH_DIFFREF=BR:A1-PS{6A:CY3}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A1-PS{6A:CY3}I:DAC-I, CH_REF=BR:A1-PS{6A:CY3}I:DAC-I_Ref, CH_TOL=BR:A1-PS{6A:CY3}I:DAC_I_Tol-SP,  CH_ARCH=BR:A1-PS{6A:CY3}I:DAC_I_Arch-I, CH_DIFFREF=BR:A1-PS{6A:CY3}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR:A1-PS{6A:CY3}I:DAC_I_DiffArch-I, CH_FLG=BR:A1-PS{6A:CY3}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:CY3}I:DAC_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:CY3}I:DAC-I, CH_REF=BR:A1-PS{6A:CY3}I:DAC-I_Ref, CH_DIFFREF=BR:A1-PS{6A:CY3}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:CY3}I:DAC-I, CH_REF=BR:A1-PS{6A:CY3}I-SP-1k, CH_DIFFREF=BR:A1-PS{6A:CY3}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A1-PS{6A:CY3}E:PS-I, CH_REF=BR:A1-PS{6A:CY3}E:PS-I_Ref, CH_TOL=BR:A1-PS{6A:CY3}E:PS_I_Tol-SP, CH_ARCH=BR:A1-PS{6A:CY3}E:PS_I_Arch-I, CH_DIFFREF=BR:A1-PS{6A:CY3}E:PS_I_DiffRef-I, CH_DIFFARCH=BR:A1-PS{6A:CY3}E:PS_I_DiffArch-I, CH_FLG=BR:A1-PS{6A:CY3}E:PS_I_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:CY3}E:PS_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:CY3}E:PS-I, CH_REF=BR:A1-PS{6A:CY3}E:PS-I_Ref, CH_DIFFREF=BR:A1-PS{6A:CY3}E:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A1-PS{6A:CY3}Cmd:PwrOn-Cmd, CH_REF=BR:A1-PS{6A:CY3}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:A1-PS{6A:CY3}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:A1-PS{6A:CY3}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:CY3}Cmd:PwrOn_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A1-PS{6A:CY3}Cmd:PwrOn-Cmd, CH_REF=BR:A1-PS{6A:CY3}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:A1-PS{6A:CY3}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A1-PS{6A:CY3}Sts:PSworks-Sts, CH_REF=BR:A1-PS{6A:CY3}Sts:PSworks-Sts_Ref, CH_ARCH=BR:A1-PS{6A:CY3}Sts:PSworks_Arch-Sts, CH_FLG=BR:A1-PS{6A:CY3}Sts:PSworks_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:CY3}Sts:PSworks_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A1-PS{6A:CY3}Sts:PSworks-Sts, CH_REF=BR:A1-PS{6A:CY3}Sts:PSworks-Sts_Ref, CH_FLG=BR:A1-PS{6A:CY3}Sts:PSworks_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")


# PSC21 Chan 1
# BR:A1-PS{6A:CY4} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:A1-PS{6A:CY4}I-SP,              OUTPUT=BR{PSC21}DAC:1-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC21}ADC:08-I,    OUTPUT=BR:A1-PS{6A:CY4}I-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC21}ADC:09-I,    OUTPUT=BR:A1-PS{6A:CY4}I:DAC-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC21}ADC:10-I,    OUTPUT=BR:A1-PS{6A:CY4}E:PS-I,      WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:A1-PS{6A:CY4}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC21}DO:0-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC21}DI:00-Sts,   OUTPUT=BR:A1-PS{6A:CY4}Sts:PSworks-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:A1-PS{6A:CY4}I-SP, OUTPUT=BR:A1-PS{6A:CY4}I-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:A1-PS{6A:CY4}I-SP-1k, OUTPUT=BR:A1-PS{6A:CY4}I-SP-1k-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A1-PS{6A:CY4}I-SP-1k, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A1-PS{6A:CY4}I-I,     OUTPUT=BR:A1-PS{6A:CY4}I-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A1-PS{6A:CY4}I-I,     WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A1-PS{6A:CY4}I:DAC-I, OUTPUT=BR:A1-PS{6A:CY4}I:DAC-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A1-PS{6A:CY4}I:DAC-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A1-PS{6A:CY4}E:PS-I,  OUTPUT=BR:A1-PS{6A:CY4}E:PS-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A1-PS{6A:CY4}E:PS-I,  WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A1-PS{6A:CY4}I-SP, CH_REF=BR:A1-PS{6A:CY4}I-SP_Ref, CH_TOL=BR:A1-PS{6A:CY4}I_SP_Tol-SP, CH_ARCH=BR:A1-PS{6A:CY4}I_SP_Arch-I, CH_DIFFREF=BR:A1-PS{6A:CY4}I_SP_DiffRef-I, CH_DIFFARCH=BR:A1-PS{6A:CY4}I_SP_DiffArch-I, CH_FLG=BR:A1-PS{6A:CY4}I_SP_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:CY4}I_SP_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:CY4}I-SP, CH_REF=BR:A1-PS{6A:CY4}I-SP_Ref, CH_DIFFREF=BR:A1-PS{6A:CY4}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A1-PS{6A:CY4}I-I, CH_REF=BR:A1-PS{6A:CY4}I-I_Ref, CH_TOL=BR:A1-PS{6A:CY4}I_I_Tol-SP, CH_ARCH=BR:A1-PS{6A:CY4}I_I_Arch-I, CH_DIFFREF=BR:A1-PS{6A:CY4}I_I_DiffRef-I, CH_DIFFARCH=BR:A1-PS{6A:CY4}I_I_DiffArch-I, CH_FLG=BR:A1-PS{6A:CY4}I_I_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:CY4}I_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:CY4}I-I, CH_REF=BR:A1-PS{6A:CY4}I-I_Ref, CH_DIFFREF=BR:A1-PS{6A:CY4}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:CY4}I-I, CH_REF=BR:A1-PS{6A:CY4}I-SP-1k, CH_DIFFREF=BR:A1-PS{6A:CY4}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A1-PS{6A:CY4}I:DAC-I, CH_REF=BR:A1-PS{6A:CY4}I:DAC-I_Ref, CH_TOL=BR:A1-PS{6A:CY4}I:DAC_I_Tol-SP,  CH_ARCH=BR:A1-PS{6A:CY4}I:DAC_I_Arch-I, CH_DIFFREF=BR:A1-PS{6A:CY4}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR:A1-PS{6A:CY4}I:DAC_I_DiffArch-I, CH_FLG=BR:A1-PS{6A:CY4}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:CY4}I:DAC_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:CY4}I:DAC-I, CH_REF=BR:A1-PS{6A:CY4}I:DAC-I_Ref, CH_DIFFREF=BR:A1-PS{6A:CY4}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:CY4}I:DAC-I, CH_REF=BR:A1-PS{6A:CY4}I-SP-1k, CH_DIFFREF=BR:A1-PS{6A:CY4}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A1-PS{6A:CY4}E:PS-I, CH_REF=BR:A1-PS{6A:CY4}E:PS-I_Ref, CH_TOL=BR:A1-PS{6A:CY4}E:PS_I_Tol-SP, CH_ARCH=BR:A1-PS{6A:CY4}E:PS_I_Arch-I, CH_DIFFREF=BR:A1-PS{6A:CY4}E:PS_I_DiffRef-I, CH_DIFFARCH=BR:A1-PS{6A:CY4}E:PS_I_DiffArch-I, CH_FLG=BR:A1-PS{6A:CY4}E:PS_I_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:CY4}E:PS_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:CY4}E:PS-I, CH_REF=BR:A1-PS{6A:CY4}E:PS-I_Ref, CH_DIFFREF=BR:A1-PS{6A:CY4}E:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A1-PS{6A:CY4}Cmd:PwrOn-Cmd, CH_REF=BR:A1-PS{6A:CY4}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:A1-PS{6A:CY4}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:A1-PS{6A:CY4}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:CY4}Cmd:PwrOn_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A1-PS{6A:CY4}Cmd:PwrOn-Cmd, CH_REF=BR:A1-PS{6A:CY4}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:A1-PS{6A:CY4}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A1-PS{6A:CY4}Sts:PSworks-Sts, CH_REF=BR:A1-PS{6A:CY4}Sts:PSworks-Sts_Ref, CH_ARCH=BR:A1-PS{6A:CY4}Sts:PSworks_Arch-Sts, CH_FLG=BR:A1-PS{6A:CY4}Sts:PSworks_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:CY4}Sts:PSworks_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A1-PS{6A:CY4}Sts:PSworks-Sts, CH_REF=BR:A1-PS{6A:CY4}Sts:PSworks-Sts_Ref, CH_FLG=BR:A1-PS{6A:CY4}Sts:PSworks_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")


# PSC22 Chan 0
# BR:A1-PS{6A:SD1} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:A1-PS{6A:SD1}I-SP,              OUTPUT=BR{PSC22}DAC:0-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC22}ADC:00-I,    OUTPUT=BR:A1-PS{6A:SD1}I-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC22}ADC:01-I,    OUTPUT=BR:A1-PS{6A:SD1}I:DAC-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC22}ADC:02-I,    OUTPUT=BR:A1-PS{6A:SD1}E:PS-I,      WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:A1-PS{6A:SD1}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC22}DO:1-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC22}DI:01-Sts,   OUTPUT=BR:A1-PS{6A:SD1}Sts:PSworks-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:A1-PS{6A:SD1}I-SP, OUTPUT=BR:A1-PS{6A:SD1}I-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:A1-PS{6A:SD1}I-SP-1k, OUTPUT=BR:A1-PS{6A:SD1}I-SP-1k-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A1-PS{6A:SD1}I-SP-1k, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A1-PS{6A:SD1}I-I,     OUTPUT=BR:A1-PS{6A:SD1}I-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A1-PS{6A:SD1}I-I,     WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A1-PS{6A:SD1}I:DAC-I, OUTPUT=BR:A1-PS{6A:SD1}I:DAC-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A1-PS{6A:SD1}I:DAC-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A1-PS{6A:SD1}E:PS-I,  OUTPUT=BR:A1-PS{6A:SD1}E:PS-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A1-PS{6A:SD1}E:PS-I,  WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A1-PS{6A:SD1}I-SP, CH_REF=BR:A1-PS{6A:SD1}I-SP_Ref, CH_TOL=BR:A1-PS{6A:SD1}I_SP_Tol-SP, CH_ARCH=BR:A1-PS{6A:SD1}I_SP_Arch-I, CH_DIFFREF=BR:A1-PS{6A:SD1}I_SP_DiffRef-I, CH_DIFFARCH=BR:A1-PS{6A:SD1}I_SP_DiffArch-I, CH_FLG=BR:A1-PS{6A:SD1}I_SP_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:SD1}I_SP_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:SD1}I-SP, CH_REF=BR:A1-PS{6A:SD1}I-SP_Ref, CH_DIFFREF=BR:A1-PS{6A:SD1}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A1-PS{6A:SD1}I-I, CH_REF=BR:A1-PS{6A:SD1}I-I_Ref, CH_TOL=BR:A1-PS{6A:SD1}I_I_Tol-SP, CH_ARCH=BR:A1-PS{6A:SD1}I_I_Arch-I, CH_DIFFREF=BR:A1-PS{6A:SD1}I_I_DiffRef-I, CH_DIFFARCH=BR:A1-PS{6A:SD1}I_I_DiffArch-I, CH_FLG=BR:A1-PS{6A:SD1}I_I_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:SD1}I_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:SD1}I-I, CH_REF=BR:A1-PS{6A:SD1}I-I_Ref, CH_DIFFREF=BR:A1-PS{6A:SD1}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:SD1}I-I, CH_REF=BR:A1-PS{6A:SD1}I-SP-1k, CH_DIFFREF=BR:A1-PS{6A:SD1}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A1-PS{6A:SD1}I:DAC-I, CH_REF=BR:A1-PS{6A:SD1}I:DAC-I_Ref, CH_TOL=BR:A1-PS{6A:SD1}I:DAC_I_Tol-SP,  CH_ARCH=BR:A1-PS{6A:SD1}I:DAC_I_Arch-I, CH_DIFFREF=BR:A1-PS{6A:SD1}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR:A1-PS{6A:SD1}I:DAC_I_DiffArch-I, CH_FLG=BR:A1-PS{6A:SD1}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:SD1}I:DAC_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:SD1}I:DAC-I, CH_REF=BR:A1-PS{6A:SD1}I:DAC-I_Ref, CH_DIFFREF=BR:A1-PS{6A:SD1}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:SD1}I:DAC-I, CH_REF=BR:A1-PS{6A:SD1}I-SP-1k, CH_DIFFREF=BR:A1-PS{6A:SD1}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A1-PS{6A:SD1}E:PS-I, CH_REF=BR:A1-PS{6A:SD1}E:PS-I_Ref, CH_TOL=BR:A1-PS{6A:SD1}E:PS_I_Tol-SP, CH_ARCH=BR:A1-PS{6A:SD1}E:PS_I_Arch-I, CH_DIFFREF=BR:A1-PS{6A:SD1}E:PS_I_DiffRef-I, CH_DIFFARCH=BR:A1-PS{6A:SD1}E:PS_I_DiffArch-I, CH_FLG=BR:A1-PS{6A:SD1}E:PS_I_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:SD1}E:PS_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:SD1}E:PS-I, CH_REF=BR:A1-PS{6A:SD1}E:PS-I_Ref, CH_DIFFREF=BR:A1-PS{6A:SD1}E:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A1-PS{6A:SD1}Cmd:PwrOn-Cmd, CH_REF=BR:A1-PS{6A:SD1}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:A1-PS{6A:SD1}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:A1-PS{6A:SD1}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:SD1}Cmd:PwrOn_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A1-PS{6A:SD1}Cmd:PwrOn-Cmd, CH_REF=BR:A1-PS{6A:SD1}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:A1-PS{6A:SD1}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A1-PS{6A:SD1}Sts:PSworks-Sts, CH_REF=BR:A1-PS{6A:SD1}Sts:PSworks-Sts_Ref, CH_ARCH=BR:A1-PS{6A:SD1}Sts:PSworks_Arch-Sts, CH_FLG=BR:A1-PS{6A:SD1}Sts:PSworks_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:SD1}Sts:PSworks_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A1-PS{6A:SD1}Sts:PSworks-Sts, CH_REF=BR:A1-PS{6A:SD1}Sts:PSworks-Sts_Ref, CH_FLG=BR:A1-PS{6A:SD1}Sts:PSworks_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")


# PSC22 Chan 1
# BR:A1-PS{6A:SD2} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:A1-PS{6A:SD2}I-SP,              OUTPUT=BR{PSC22}DAC:1-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC22}ADC:08-I,    OUTPUT=BR:A1-PS{6A:SD2}I-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC22}ADC:09-I,    OUTPUT=BR:A1-PS{6A:SD2}I:DAC-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC22}ADC:10-I,    OUTPUT=BR:A1-PS{6A:SD2}E:PS-I,      WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:A1-PS{6A:SD2}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC22}DO:0-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC22}DI:00-Sts,   OUTPUT=BR:A1-PS{6A:SD2}Sts:PSworks-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:A1-PS{6A:SD2}I-SP, OUTPUT=BR:A1-PS{6A:SD2}I-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:A1-PS{6A:SD2}I-SP-1k, OUTPUT=BR:A1-PS{6A:SD2}I-SP-1k-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A1-PS{6A:SD2}I-SP-1k, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A1-PS{6A:SD2}I-I,     OUTPUT=BR:A1-PS{6A:SD2}I-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A1-PS{6A:SD2}I-I,     WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A1-PS{6A:SD2}I:DAC-I, OUTPUT=BR:A1-PS{6A:SD2}I:DAC-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A1-PS{6A:SD2}I:DAC-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A1-PS{6A:SD2}E:PS-I,  OUTPUT=BR:A1-PS{6A:SD2}E:PS-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A1-PS{6A:SD2}E:PS-I,  WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A1-PS{6A:SD2}I-SP, CH_REF=BR:A1-PS{6A:SD2}I-SP_Ref, CH_TOL=BR:A1-PS{6A:SD2}I_SP_Tol-SP, CH_ARCH=BR:A1-PS{6A:SD2}I_SP_Arch-I, CH_DIFFREF=BR:A1-PS{6A:SD2}I_SP_DiffRef-I, CH_DIFFARCH=BR:A1-PS{6A:SD2}I_SP_DiffArch-I, CH_FLG=BR:A1-PS{6A:SD2}I_SP_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:SD2}I_SP_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:SD2}I-SP, CH_REF=BR:A1-PS{6A:SD2}I-SP_Ref, CH_DIFFREF=BR:A1-PS{6A:SD2}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A1-PS{6A:SD2}I-I, CH_REF=BR:A1-PS{6A:SD2}I-I_Ref, CH_TOL=BR:A1-PS{6A:SD2}I_I_Tol-SP, CH_ARCH=BR:A1-PS{6A:SD2}I_I_Arch-I, CH_DIFFREF=BR:A1-PS{6A:SD2}I_I_DiffRef-I, CH_DIFFARCH=BR:A1-PS{6A:SD2}I_I_DiffArch-I, CH_FLG=BR:A1-PS{6A:SD2}I_I_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:SD2}I_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:SD2}I-I, CH_REF=BR:A1-PS{6A:SD2}I-I_Ref, CH_DIFFREF=BR:A1-PS{6A:SD2}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:SD2}I-I, CH_REF=BR:A1-PS{6A:SD2}I-SP-1k, CH_DIFFREF=BR:A1-PS{6A:SD2}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A1-PS{6A:SD2}I:DAC-I, CH_REF=BR:A1-PS{6A:SD2}I:DAC-I_Ref, CH_TOL=BR:A1-PS{6A:SD2}I:DAC_I_Tol-SP,  CH_ARCH=BR:A1-PS{6A:SD2}I:DAC_I_Arch-I, CH_DIFFREF=BR:A1-PS{6A:SD2}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR:A1-PS{6A:SD2}I:DAC_I_DiffArch-I, CH_FLG=BR:A1-PS{6A:SD2}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:SD2}I:DAC_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:SD2}I:DAC-I, CH_REF=BR:A1-PS{6A:SD2}I:DAC-I_Ref, CH_DIFFREF=BR:A1-PS{6A:SD2}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:SD2}I:DAC-I, CH_REF=BR:A1-PS{6A:SD2}I-SP-1k, CH_DIFFREF=BR:A1-PS{6A:SD2}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A1-PS{6A:SD2}E:PS-I, CH_REF=BR:A1-PS{6A:SD2}E:PS-I_Ref, CH_TOL=BR:A1-PS{6A:SD2}E:PS_I_Tol-SP, CH_ARCH=BR:A1-PS{6A:SD2}E:PS_I_Arch-I, CH_DIFFREF=BR:A1-PS{6A:SD2}E:PS_I_DiffRef-I, CH_DIFFARCH=BR:A1-PS{6A:SD2}E:PS_I_DiffArch-I, CH_FLG=BR:A1-PS{6A:SD2}E:PS_I_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:SD2}E:PS_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:SD2}E:PS-I, CH_REF=BR:A1-PS{6A:SD2}E:PS-I_Ref, CH_DIFFREF=BR:A1-PS{6A:SD2}E:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A1-PS{6A:SD2}Cmd:PwrOn-Cmd, CH_REF=BR:A1-PS{6A:SD2}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:A1-PS{6A:SD2}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:A1-PS{6A:SD2}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:SD2}Cmd:PwrOn_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A1-PS{6A:SD2}Cmd:PwrOn-Cmd, CH_REF=BR:A1-PS{6A:SD2}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:A1-PS{6A:SD2}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A1-PS{6A:SD2}Sts:PSworks-Sts, CH_REF=BR:A1-PS{6A:SD2}Sts:PSworks-Sts_Ref, CH_ARCH=BR:A1-PS{6A:SD2}Sts:PSworks_Arch-Sts, CH_FLG=BR:A1-PS{6A:SD2}Sts:PSworks_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:SD2}Sts:PSworks_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A1-PS{6A:SD2}Sts:PSworks-Sts, CH_REF=BR:A1-PS{6A:SD2}Sts:PSworks-Sts_Ref, CH_FLG=BR:A1-PS{6A:SD2}Sts:PSworks_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")


# PSC23 Chan 0
# BR:A1-PS{6A:SF2} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:A1-PS{6A:SF2}I-SP,              OUTPUT=BR{PSC23}DAC:0-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC23}ADC:00-I,    OUTPUT=BR:A1-PS{6A:SF2}I-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC23}ADC:01-I,    OUTPUT=BR:A1-PS{6A:SF2}I:DAC-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC23}ADC:02-I,    OUTPUT=BR:A1-PS{6A:SF2}E:PS-I,      WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:A1-PS{6A:SF2}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC23}DO:1-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC23}DI:01-Sts,   OUTPUT=BR:A1-PS{6A:SF2}Sts:PSworks-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:A1-PS{6A:SF2}I-SP, OUTPUT=BR:A1-PS{6A:SF2}I-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:A1-PS{6A:SF2}I-SP-1k, OUTPUT=BR:A1-PS{6A:SF2}I-SP-1k-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A1-PS{6A:SF2}I-SP-1k, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A1-PS{6A:SF2}I-I,     OUTPUT=BR:A1-PS{6A:SF2}I-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A1-PS{6A:SF2}I-I,     WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A1-PS{6A:SF2}I:DAC-I, OUTPUT=BR:A1-PS{6A:SF2}I:DAC-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A1-PS{6A:SF2}I:DAC-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A1-PS{6A:SF2}E:PS-I,  OUTPUT=BR:A1-PS{6A:SF2}E:PS-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A1-PS{6A:SF2}E:PS-I,  WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A1-PS{6A:SF2}I-SP, CH_REF=BR:A1-PS{6A:SF2}I-SP_Ref, CH_TOL=BR:A1-PS{6A:SF2}I_SP_Tol-SP, CH_ARCH=BR:A1-PS{6A:SF2}I_SP_Arch-I, CH_DIFFREF=BR:A1-PS{6A:SF2}I_SP_DiffRef-I, CH_DIFFARCH=BR:A1-PS{6A:SF2}I_SP_DiffArch-I, CH_FLG=BR:A1-PS{6A:SF2}I_SP_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:SF2}I_SP_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:SF2}I-SP, CH_REF=BR:A1-PS{6A:SF2}I-SP_Ref, CH_DIFFREF=BR:A1-PS{6A:SF2}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A1-PS{6A:SF2}I-I, CH_REF=BR:A1-PS{6A:SF2}I-I_Ref, CH_TOL=BR:A1-PS{6A:SF2}I_I_Tol-SP, CH_ARCH=BR:A1-PS{6A:SF2}I_I_Arch-I, CH_DIFFREF=BR:A1-PS{6A:SF2}I_I_DiffRef-I, CH_DIFFARCH=BR:A1-PS{6A:SF2}I_I_DiffArch-I, CH_FLG=BR:A1-PS{6A:SF2}I_I_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:SF2}I_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:SF2}I-I, CH_REF=BR:A1-PS{6A:SF2}I-I_Ref, CH_DIFFREF=BR:A1-PS{6A:SF2}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:SF2}I-I, CH_REF=BR:A1-PS{6A:SF2}I-SP-1k, CH_DIFFREF=BR:A1-PS{6A:SF2}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A1-PS{6A:SF2}I:DAC-I, CH_REF=BR:A1-PS{6A:SF2}I:DAC-I_Ref, CH_TOL=BR:A1-PS{6A:SF2}I:DAC_I_Tol-SP,  CH_ARCH=BR:A1-PS{6A:SF2}I:DAC_I_Arch-I, CH_DIFFREF=BR:A1-PS{6A:SF2}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR:A1-PS{6A:SF2}I:DAC_I_DiffArch-I, CH_FLG=BR:A1-PS{6A:SF2}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:SF2}I:DAC_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:SF2}I:DAC-I, CH_REF=BR:A1-PS{6A:SF2}I:DAC-I_Ref, CH_DIFFREF=BR:A1-PS{6A:SF2}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:SF2}I:DAC-I, CH_REF=BR:A1-PS{6A:SF2}I-SP-1k, CH_DIFFREF=BR:A1-PS{6A:SF2}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A1-PS{6A:SF2}E:PS-I, CH_REF=BR:A1-PS{6A:SF2}E:PS-I_Ref, CH_TOL=BR:A1-PS{6A:SF2}E:PS_I_Tol-SP, CH_ARCH=BR:A1-PS{6A:SF2}E:PS_I_Arch-I, CH_DIFFREF=BR:A1-PS{6A:SF2}E:PS_I_DiffRef-I, CH_DIFFARCH=BR:A1-PS{6A:SF2}E:PS_I_DiffArch-I, CH_FLG=BR:A1-PS{6A:SF2}E:PS_I_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:SF2}E:PS_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A1-PS{6A:SF2}E:PS-I, CH_REF=BR:A1-PS{6A:SF2}E:PS-I_Ref, CH_DIFFREF=BR:A1-PS{6A:SF2}E:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A1-PS{6A:SF2}Cmd:PwrOn-Cmd, CH_REF=BR:A1-PS{6A:SF2}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:A1-PS{6A:SF2}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:A1-PS{6A:SF2}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:SF2}Cmd:PwrOn_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A1-PS{6A:SF2}Cmd:PwrOn-Cmd, CH_REF=BR:A1-PS{6A:SF2}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:A1-PS{6A:SF2}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A1-PS{6A:SF2}Sts:PSworks-Sts, CH_REF=BR:A1-PS{6A:SF2}Sts:PSworks-Sts_Ref, CH_ARCH=BR:A1-PS{6A:SF2}Sts:PSworks_Arch-Sts, CH_FLG=BR:A1-PS{6A:SF2}Sts:PSworks_MonitFlg-Sts, CH_FLGARCH=BR:A1-PS{6A:SF2}Sts:PSworks_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A1-PS{6A:SF2}Sts:PSworks-Sts, CH_REF=BR:A1-PS{6A:SF2}Sts:PSworks-Sts_Ref, CH_FLG=BR:A1-PS{6A:SF2}Sts:PSworks_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")


# PSC23 Channel: 1  no PS

# PSC24 Chan 0
# BR:XS-PS{6A:CXW2} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:XS-PS{6A:CXW2}I-SP,              OUTPUT=BR{PSC24}DAC:0-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC24}ADC:00-I,    OUTPUT=BR:XS-PS{6A:CXW2}I-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC24}ADC:01-I,    OUTPUT=BR:XS-PS{6A:CXW2}I:DAC-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC24}ADC:02-I,    OUTPUT=BR:XS-PS{6A:CXW2}E:PS-I,      WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:XS-PS{6A:CXW2}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC24}DO:1-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC24}DI:01-Sts,   OUTPUT=BR:XS-PS{6A:CXW2}Sts:PSworks-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:XS-PS{6A:CXW2}I-SP, OUTPUT=BR:XS-PS{6A:CXW2}I-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:XS-PS{6A:CXW2}I-SP-1k, OUTPUT=BR:XS-PS{6A:CXW2}I-SP-1k-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:XS-PS{6A:CXW2}I-SP-1k, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:XS-PS{6A:CXW2}I-I,     OUTPUT=BR:XS-PS{6A:CXW2}I-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:XS-PS{6A:CXW2}I-I,     WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:XS-PS{6A:CXW2}I:DAC-I, OUTPUT=BR:XS-PS{6A:CXW2}I:DAC-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:XS-PS{6A:CXW2}I:DAC-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:XS-PS{6A:CXW2}E:PS-I,  OUTPUT=BR:XS-PS{6A:CXW2}E:PS-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:XS-PS{6A:CXW2}E:PS-I,  WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:XS-PS{6A:CXW2}I-SP, CH_REF=BR:XS-PS{6A:CXW2}I-SP_Ref, CH_TOL=BR:XS-PS{6A:CXW2}I_SP_Tol-SP, CH_ARCH=BR:XS-PS{6A:CXW2}I_SP_Arch-I, CH_DIFFREF=BR:XS-PS{6A:CXW2}I_SP_DiffRef-I, CH_DIFFARCH=BR:XS-PS{6A:CXW2}I_SP_DiffArch-I, CH_FLG=BR:XS-PS{6A:CXW2}I_SP_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{6A:CXW2}I_SP_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{6A:CXW2}I-SP, CH_REF=BR:XS-PS{6A:CXW2}I-SP_Ref, CH_DIFFREF=BR:XS-PS{6A:CXW2}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:XS-PS{6A:CXW2}I-I, CH_REF=BR:XS-PS{6A:CXW2}I-I_Ref, CH_TOL=BR:XS-PS{6A:CXW2}I_I_Tol-SP, CH_ARCH=BR:XS-PS{6A:CXW2}I_I_Arch-I, CH_DIFFREF=BR:XS-PS{6A:CXW2}I_I_DiffRef-I, CH_DIFFARCH=BR:XS-PS{6A:CXW2}I_I_DiffArch-I, CH_FLG=BR:XS-PS{6A:CXW2}I_I_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{6A:CXW2}I_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{6A:CXW2}I-I, CH_REF=BR:XS-PS{6A:CXW2}I-I_Ref, CH_DIFFREF=BR:XS-PS{6A:CXW2}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{6A:CXW2}I-I, CH_REF=BR:XS-PS{6A:CXW2}I-SP-1k, CH_DIFFREF=BR:XS-PS{6A:CXW2}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:XS-PS{6A:CXW2}I:DAC-I, CH_REF=BR:XS-PS{6A:CXW2}I:DAC-I_Ref, CH_TOL=BR:XS-PS{6A:CXW2}I:DAC_I_Tol-SP,  CH_ARCH=BR:XS-PS{6A:CXW2}I:DAC_I_Arch-I, CH_DIFFREF=BR:XS-PS{6A:CXW2}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR:XS-PS{6A:CXW2}I:DAC_I_DiffArch-I, CH_FLG=BR:XS-PS{6A:CXW2}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{6A:CXW2}I:DAC_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{6A:CXW2}I:DAC-I, CH_REF=BR:XS-PS{6A:CXW2}I:DAC-I_Ref, CH_DIFFREF=BR:XS-PS{6A:CXW2}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{6A:CXW2}I:DAC-I, CH_REF=BR:XS-PS{6A:CXW2}I-SP-1k, CH_DIFFREF=BR:XS-PS{6A:CXW2}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:XS-PS{6A:CXW2}E:PS-I, CH_REF=BR:XS-PS{6A:CXW2}E:PS-I_Ref, CH_TOL=BR:XS-PS{6A:CXW2}E:PS_I_Tol-SP, CH_ARCH=BR:XS-PS{6A:CXW2}E:PS_I_Arch-I, CH_DIFFREF=BR:XS-PS{6A:CXW2}E:PS_I_DiffRef-I, CH_DIFFARCH=BR:XS-PS{6A:CXW2}E:PS_I_DiffArch-I, CH_FLG=BR:XS-PS{6A:CXW2}E:PS_I_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{6A:CXW2}E:PS_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{6A:CXW2}E:PS-I, CH_REF=BR:XS-PS{6A:CXW2}E:PS-I_Ref, CH_DIFFREF=BR:XS-PS{6A:CXW2}E:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{6A:CXW2}Cmd:PwrOn-Cmd, CH_REF=BR:XS-PS{6A:CXW2}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:XS-PS{6A:CXW2}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:XS-PS{6A:CXW2}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{6A:CXW2}Cmd:PwrOn_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{6A:CXW2}Cmd:PwrOn-Cmd, CH_REF=BR:XS-PS{6A:CXW2}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:XS-PS{6A:CXW2}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{6A:CXW2}Sts:PSworks-Sts, CH_REF=BR:XS-PS{6A:CXW2}Sts:PSworks-Sts_Ref, CH_ARCH=BR:XS-PS{6A:CXW2}Sts:PSworks_Arch-Sts, CH_FLG=BR:XS-PS{6A:CXW2}Sts:PSworks_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{6A:CXW2}Sts:PSworks_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{6A:CXW2}Sts:PSworks-Sts, CH_REF=BR:XS-PS{6A:CXW2}Sts:PSworks-Sts_Ref, CH_FLG=BR:XS-PS{6A:CXW2}Sts:PSworks_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")


# PSC24 Chan 1
# BR:A2-PS{6A:CX1} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:A2-PS{6A:CX1}I-SP,              OUTPUT=BR{PSC24}DAC:1-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC24}ADC:08-I,    OUTPUT=BR:A2-PS{6A:CX1}I-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC24}ADC:09-I,    OUTPUT=BR:A2-PS{6A:CX1}I:DAC-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC24}ADC:10-I,    OUTPUT=BR:A2-PS{6A:CX1}E:PS-I,      WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:A2-PS{6A:CX1}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC24}DO:0-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC24}DI:00-Sts,   OUTPUT=BR:A2-PS{6A:CX1}Sts:PSworks-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:A2-PS{6A:CX1}I-SP, OUTPUT=BR:A2-PS{6A:CX1}I-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:A2-PS{6A:CX1}I-SP-1k, OUTPUT=BR:A2-PS{6A:CX1}I-SP-1k-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A2-PS{6A:CX1}I-SP-1k, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A2-PS{6A:CX1}I-I,     OUTPUT=BR:A2-PS{6A:CX1}I-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A2-PS{6A:CX1}I-I,     WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A2-PS{6A:CX1}I:DAC-I, OUTPUT=BR:A2-PS{6A:CX1}I:DAC-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A2-PS{6A:CX1}I:DAC-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A2-PS{6A:CX1}E:PS-I,  OUTPUT=BR:A2-PS{6A:CX1}E:PS-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A2-PS{6A:CX1}E:PS-I,  WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A2-PS{6A:CX1}I-SP, CH_REF=BR:A2-PS{6A:CX1}I-SP_Ref, CH_TOL=BR:A2-PS{6A:CX1}I_SP_Tol-SP, CH_ARCH=BR:A2-PS{6A:CX1}I_SP_Arch-I, CH_DIFFREF=BR:A2-PS{6A:CX1}I_SP_DiffRef-I, CH_DIFFARCH=BR:A2-PS{6A:CX1}I_SP_DiffArch-I, CH_FLG=BR:A2-PS{6A:CX1}I_SP_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:CX1}I_SP_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:CX1}I-SP, CH_REF=BR:A2-PS{6A:CX1}I-SP_Ref, CH_DIFFREF=BR:A2-PS{6A:CX1}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A2-PS{6A:CX1}I-I, CH_REF=BR:A2-PS{6A:CX1}I-I_Ref, CH_TOL=BR:A2-PS{6A:CX1}I_I_Tol-SP, CH_ARCH=BR:A2-PS{6A:CX1}I_I_Arch-I, CH_DIFFREF=BR:A2-PS{6A:CX1}I_I_DiffRef-I, CH_DIFFARCH=BR:A2-PS{6A:CX1}I_I_DiffArch-I, CH_FLG=BR:A2-PS{6A:CX1}I_I_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:CX1}I_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:CX1}I-I, CH_REF=BR:A2-PS{6A:CX1}I-I_Ref, CH_DIFFREF=BR:A2-PS{6A:CX1}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:CX1}I-I, CH_REF=BR:A2-PS{6A:CX1}I-SP-1k, CH_DIFFREF=BR:A2-PS{6A:CX1}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A2-PS{6A:CX1}I:DAC-I, CH_REF=BR:A2-PS{6A:CX1}I:DAC-I_Ref, CH_TOL=BR:A2-PS{6A:CX1}I:DAC_I_Tol-SP,  CH_ARCH=BR:A2-PS{6A:CX1}I:DAC_I_Arch-I, CH_DIFFREF=BR:A2-PS{6A:CX1}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR:A2-PS{6A:CX1}I:DAC_I_DiffArch-I, CH_FLG=BR:A2-PS{6A:CX1}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:CX1}I:DAC_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:CX1}I:DAC-I, CH_REF=BR:A2-PS{6A:CX1}I:DAC-I_Ref, CH_DIFFREF=BR:A2-PS{6A:CX1}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:CX1}I:DAC-I, CH_REF=BR:A2-PS{6A:CX1}I-SP-1k, CH_DIFFREF=BR:A2-PS{6A:CX1}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A2-PS{6A:CX1}E:PS-I, CH_REF=BR:A2-PS{6A:CX1}E:PS-I_Ref, CH_TOL=BR:A2-PS{6A:CX1}E:PS_I_Tol-SP, CH_ARCH=BR:A2-PS{6A:CX1}E:PS_I_Arch-I, CH_DIFFREF=BR:A2-PS{6A:CX1}E:PS_I_DiffRef-I, CH_DIFFARCH=BR:A2-PS{6A:CX1}E:PS_I_DiffArch-I, CH_FLG=BR:A2-PS{6A:CX1}E:PS_I_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:CX1}E:PS_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:CX1}E:PS-I, CH_REF=BR:A2-PS{6A:CX1}E:PS-I_Ref, CH_DIFFREF=BR:A2-PS{6A:CX1}E:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A2-PS{6A:CX1}Cmd:PwrOn-Cmd, CH_REF=BR:A2-PS{6A:CX1}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:A2-PS{6A:CX1}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:A2-PS{6A:CX1}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:CX1}Cmd:PwrOn_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A2-PS{6A:CX1}Cmd:PwrOn-Cmd, CH_REF=BR:A2-PS{6A:CX1}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:A2-PS{6A:CX1}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A2-PS{6A:CX1}Sts:PSworks-Sts, CH_REF=BR:A2-PS{6A:CX1}Sts:PSworks-Sts_Ref, CH_ARCH=BR:A2-PS{6A:CX1}Sts:PSworks_Arch-Sts, CH_FLG=BR:A2-PS{6A:CX1}Sts:PSworks_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:CX1}Sts:PSworks_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A2-PS{6A:CX1}Sts:PSworks-Sts, CH_REF=BR:A2-PS{6A:CX1}Sts:PSworks-Sts_Ref, CH_FLG=BR:A2-PS{6A:CX1}Sts:PSworks_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")


# PSC25 Chan 0
# BR:A2-PS{6A:CX2} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:A2-PS{6A:CX2}I-SP,              OUTPUT=BR{PSC25}DAC:0-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC25}ADC:00-I,    OUTPUT=BR:A2-PS{6A:CX2}I-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC25}ADC:01-I,    OUTPUT=BR:A2-PS{6A:CX2}I:DAC-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC25}ADC:02-I,    OUTPUT=BR:A2-PS{6A:CX2}E:PS-I,      WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:A2-PS{6A:CX2}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC25}DO:1-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC25}DI:01-Sts,   OUTPUT=BR:A2-PS{6A:CX2}Sts:PSworks-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:A2-PS{6A:CX2}I-SP, OUTPUT=BR:A2-PS{6A:CX2}I-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:A2-PS{6A:CX2}I-SP-1k, OUTPUT=BR:A2-PS{6A:CX2}I-SP-1k-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A2-PS{6A:CX2}I-SP-1k, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A2-PS{6A:CX2}I-I,     OUTPUT=BR:A2-PS{6A:CX2}I-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A2-PS{6A:CX2}I-I,     WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A2-PS{6A:CX2}I:DAC-I, OUTPUT=BR:A2-PS{6A:CX2}I:DAC-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A2-PS{6A:CX2}I:DAC-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A2-PS{6A:CX2}E:PS-I,  OUTPUT=BR:A2-PS{6A:CX2}E:PS-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A2-PS{6A:CX2}E:PS-I,  WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A2-PS{6A:CX2}I-SP, CH_REF=BR:A2-PS{6A:CX2}I-SP_Ref, CH_TOL=BR:A2-PS{6A:CX2}I_SP_Tol-SP, CH_ARCH=BR:A2-PS{6A:CX2}I_SP_Arch-I, CH_DIFFREF=BR:A2-PS{6A:CX2}I_SP_DiffRef-I, CH_DIFFARCH=BR:A2-PS{6A:CX2}I_SP_DiffArch-I, CH_FLG=BR:A2-PS{6A:CX2}I_SP_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:CX2}I_SP_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:CX2}I-SP, CH_REF=BR:A2-PS{6A:CX2}I-SP_Ref, CH_DIFFREF=BR:A2-PS{6A:CX2}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A2-PS{6A:CX2}I-I, CH_REF=BR:A2-PS{6A:CX2}I-I_Ref, CH_TOL=BR:A2-PS{6A:CX2}I_I_Tol-SP, CH_ARCH=BR:A2-PS{6A:CX2}I_I_Arch-I, CH_DIFFREF=BR:A2-PS{6A:CX2}I_I_DiffRef-I, CH_DIFFARCH=BR:A2-PS{6A:CX2}I_I_DiffArch-I, CH_FLG=BR:A2-PS{6A:CX2}I_I_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:CX2}I_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:CX2}I-I, CH_REF=BR:A2-PS{6A:CX2}I-I_Ref, CH_DIFFREF=BR:A2-PS{6A:CX2}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:CX2}I-I, CH_REF=BR:A2-PS{6A:CX2}I-SP-1k, CH_DIFFREF=BR:A2-PS{6A:CX2}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A2-PS{6A:CX2}I:DAC-I, CH_REF=BR:A2-PS{6A:CX2}I:DAC-I_Ref, CH_TOL=BR:A2-PS{6A:CX2}I:DAC_I_Tol-SP,  CH_ARCH=BR:A2-PS{6A:CX2}I:DAC_I_Arch-I, CH_DIFFREF=BR:A2-PS{6A:CX2}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR:A2-PS{6A:CX2}I:DAC_I_DiffArch-I, CH_FLG=BR:A2-PS{6A:CX2}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:CX2}I:DAC_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:CX2}I:DAC-I, CH_REF=BR:A2-PS{6A:CX2}I:DAC-I_Ref, CH_DIFFREF=BR:A2-PS{6A:CX2}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:CX2}I:DAC-I, CH_REF=BR:A2-PS{6A:CX2}I-SP-1k, CH_DIFFREF=BR:A2-PS{6A:CX2}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A2-PS{6A:CX2}E:PS-I, CH_REF=BR:A2-PS{6A:CX2}E:PS-I_Ref, CH_TOL=BR:A2-PS{6A:CX2}E:PS_I_Tol-SP, CH_ARCH=BR:A2-PS{6A:CX2}E:PS_I_Arch-I, CH_DIFFREF=BR:A2-PS{6A:CX2}E:PS_I_DiffRef-I, CH_DIFFARCH=BR:A2-PS{6A:CX2}E:PS_I_DiffArch-I, CH_FLG=BR:A2-PS{6A:CX2}E:PS_I_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:CX2}E:PS_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:CX2}E:PS-I, CH_REF=BR:A2-PS{6A:CX2}E:PS-I_Ref, CH_DIFFREF=BR:A2-PS{6A:CX2}E:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A2-PS{6A:CX2}Cmd:PwrOn-Cmd, CH_REF=BR:A2-PS{6A:CX2}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:A2-PS{6A:CX2}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:A2-PS{6A:CX2}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:CX2}Cmd:PwrOn_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A2-PS{6A:CX2}Cmd:PwrOn-Cmd, CH_REF=BR:A2-PS{6A:CX2}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:A2-PS{6A:CX2}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A2-PS{6A:CX2}Sts:PSworks-Sts, CH_REF=BR:A2-PS{6A:CX2}Sts:PSworks-Sts_Ref, CH_ARCH=BR:A2-PS{6A:CX2}Sts:PSworks_Arch-Sts, CH_FLG=BR:A2-PS{6A:CX2}Sts:PSworks_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:CX2}Sts:PSworks_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A2-PS{6A:CX2}Sts:PSworks-Sts, CH_REF=BR:A2-PS{6A:CX2}Sts:PSworks-Sts_Ref, CH_FLG=BR:A2-PS{6A:CX2}Sts:PSworks_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")


# PSC25 Chan 1
# BR:A2-PS{6A:CX3} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:A2-PS{6A:CX3}I-SP,              OUTPUT=BR{PSC25}DAC:1-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC25}ADC:08-I,    OUTPUT=BR:A2-PS{6A:CX3}I-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC25}ADC:09-I,    OUTPUT=BR:A2-PS{6A:CX3}I:DAC-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC25}ADC:10-I,    OUTPUT=BR:A2-PS{6A:CX3}E:PS-I,      WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:A2-PS{6A:CX3}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC25}DO:0-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC25}DI:00-Sts,   OUTPUT=BR:A2-PS{6A:CX3}Sts:PSworks-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:A2-PS{6A:CX3}I-SP, OUTPUT=BR:A2-PS{6A:CX3}I-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:A2-PS{6A:CX3}I-SP-1k, OUTPUT=BR:A2-PS{6A:CX3}I-SP-1k-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A2-PS{6A:CX3}I-SP-1k, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A2-PS{6A:CX3}I-I,     OUTPUT=BR:A2-PS{6A:CX3}I-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A2-PS{6A:CX3}I-I,     WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A2-PS{6A:CX3}I:DAC-I, OUTPUT=BR:A2-PS{6A:CX3}I:DAC-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A2-PS{6A:CX3}I:DAC-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A2-PS{6A:CX3}E:PS-I,  OUTPUT=BR:A2-PS{6A:CX3}E:PS-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A2-PS{6A:CX3}E:PS-I,  WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A2-PS{6A:CX3}I-SP, CH_REF=BR:A2-PS{6A:CX3}I-SP_Ref, CH_TOL=BR:A2-PS{6A:CX3}I_SP_Tol-SP, CH_ARCH=BR:A2-PS{6A:CX3}I_SP_Arch-I, CH_DIFFREF=BR:A2-PS{6A:CX3}I_SP_DiffRef-I, CH_DIFFARCH=BR:A2-PS{6A:CX3}I_SP_DiffArch-I, CH_FLG=BR:A2-PS{6A:CX3}I_SP_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:CX3}I_SP_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:CX3}I-SP, CH_REF=BR:A2-PS{6A:CX3}I-SP_Ref, CH_DIFFREF=BR:A2-PS{6A:CX3}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A2-PS{6A:CX3}I-I, CH_REF=BR:A2-PS{6A:CX3}I-I_Ref, CH_TOL=BR:A2-PS{6A:CX3}I_I_Tol-SP, CH_ARCH=BR:A2-PS{6A:CX3}I_I_Arch-I, CH_DIFFREF=BR:A2-PS{6A:CX3}I_I_DiffRef-I, CH_DIFFARCH=BR:A2-PS{6A:CX3}I_I_DiffArch-I, CH_FLG=BR:A2-PS{6A:CX3}I_I_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:CX3}I_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:CX3}I-I, CH_REF=BR:A2-PS{6A:CX3}I-I_Ref, CH_DIFFREF=BR:A2-PS{6A:CX3}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:CX3}I-I, CH_REF=BR:A2-PS{6A:CX3}I-SP-1k, CH_DIFFREF=BR:A2-PS{6A:CX3}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A2-PS{6A:CX3}I:DAC-I, CH_REF=BR:A2-PS{6A:CX3}I:DAC-I_Ref, CH_TOL=BR:A2-PS{6A:CX3}I:DAC_I_Tol-SP,  CH_ARCH=BR:A2-PS{6A:CX3}I:DAC_I_Arch-I, CH_DIFFREF=BR:A2-PS{6A:CX3}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR:A2-PS{6A:CX3}I:DAC_I_DiffArch-I, CH_FLG=BR:A2-PS{6A:CX3}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:CX3}I:DAC_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:CX3}I:DAC-I, CH_REF=BR:A2-PS{6A:CX3}I:DAC-I_Ref, CH_DIFFREF=BR:A2-PS{6A:CX3}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:CX3}I:DAC-I, CH_REF=BR:A2-PS{6A:CX3}I-SP-1k, CH_DIFFREF=BR:A2-PS{6A:CX3}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A2-PS{6A:CX3}E:PS-I, CH_REF=BR:A2-PS{6A:CX3}E:PS-I_Ref, CH_TOL=BR:A2-PS{6A:CX3}E:PS_I_Tol-SP, CH_ARCH=BR:A2-PS{6A:CX3}E:PS_I_Arch-I, CH_DIFFREF=BR:A2-PS{6A:CX3}E:PS_I_DiffRef-I, CH_DIFFARCH=BR:A2-PS{6A:CX3}E:PS_I_DiffArch-I, CH_FLG=BR:A2-PS{6A:CX3}E:PS_I_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:CX3}E:PS_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:CX3}E:PS-I, CH_REF=BR:A2-PS{6A:CX3}E:PS-I_Ref, CH_DIFFREF=BR:A2-PS{6A:CX3}E:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A2-PS{6A:CX3}Cmd:PwrOn-Cmd, CH_REF=BR:A2-PS{6A:CX3}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:A2-PS{6A:CX3}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:A2-PS{6A:CX3}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:CX3}Cmd:PwrOn_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A2-PS{6A:CX3}Cmd:PwrOn-Cmd, CH_REF=BR:A2-PS{6A:CX3}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:A2-PS{6A:CX3}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A2-PS{6A:CX3}Sts:PSworks-Sts, CH_REF=BR:A2-PS{6A:CX3}Sts:PSworks-Sts_Ref, CH_ARCH=BR:A2-PS{6A:CX3}Sts:PSworks_Arch-Sts, CH_FLG=BR:A2-PS{6A:CX3}Sts:PSworks_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:CX3}Sts:PSworks_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A2-PS{6A:CX3}Sts:PSworks-Sts, CH_REF=BR:A2-PS{6A:CX3}Sts:PSworks-Sts_Ref, CH_FLG=BR:A2-PS{6A:CX3}Sts:PSworks_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")


# PSC26 Chan 0
# BR:XS-PS{6A:CXW1} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:XS-PS{6A:CXW1}I-SP,              OUTPUT=BR{PSC26}DAC:0-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC26}ADC:00-I,    OUTPUT=BR:XS-PS{6A:CXW1}I-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC26}ADC:01-I,    OUTPUT=BR:XS-PS{6A:CXW1}I:DAC-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC26}ADC:02-I,    OUTPUT=BR:XS-PS{6A:CXW1}E:PS-I,      WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:XS-PS{6A:CXW1}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC26}DO:1-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC26}DI:01-Sts,   OUTPUT=BR:XS-PS{6A:CXW1}Sts:PSworks-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:XS-PS{6A:CXW1}I-SP, OUTPUT=BR:XS-PS{6A:CXW1}I-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:XS-PS{6A:CXW1}I-SP-1k, OUTPUT=BR:XS-PS{6A:CXW1}I-SP-1k-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:XS-PS{6A:CXW1}I-SP-1k, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:XS-PS{6A:CXW1}I-I,     OUTPUT=BR:XS-PS{6A:CXW1}I-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:XS-PS{6A:CXW1}I-I,     WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:XS-PS{6A:CXW1}I:DAC-I, OUTPUT=BR:XS-PS{6A:CXW1}I:DAC-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:XS-PS{6A:CXW1}I:DAC-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:XS-PS{6A:CXW1}E:PS-I,  OUTPUT=BR:XS-PS{6A:CXW1}E:PS-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:XS-PS{6A:CXW1}E:PS-I,  WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:XS-PS{6A:CXW1}I-SP, CH_REF=BR:XS-PS{6A:CXW1}I-SP_Ref, CH_TOL=BR:XS-PS{6A:CXW1}I_SP_Tol-SP, CH_ARCH=BR:XS-PS{6A:CXW1}I_SP_Arch-I, CH_DIFFREF=BR:XS-PS{6A:CXW1}I_SP_DiffRef-I, CH_DIFFARCH=BR:XS-PS{6A:CXW1}I_SP_DiffArch-I, CH_FLG=BR:XS-PS{6A:CXW1}I_SP_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{6A:CXW1}I_SP_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{6A:CXW1}I-SP, CH_REF=BR:XS-PS{6A:CXW1}I-SP_Ref, CH_DIFFREF=BR:XS-PS{6A:CXW1}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:XS-PS{6A:CXW1}I-I, CH_REF=BR:XS-PS{6A:CXW1}I-I_Ref, CH_TOL=BR:XS-PS{6A:CXW1}I_I_Tol-SP, CH_ARCH=BR:XS-PS{6A:CXW1}I_I_Arch-I, CH_DIFFREF=BR:XS-PS{6A:CXW1}I_I_DiffRef-I, CH_DIFFARCH=BR:XS-PS{6A:CXW1}I_I_DiffArch-I, CH_FLG=BR:XS-PS{6A:CXW1}I_I_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{6A:CXW1}I_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{6A:CXW1}I-I, CH_REF=BR:XS-PS{6A:CXW1}I-I_Ref, CH_DIFFREF=BR:XS-PS{6A:CXW1}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{6A:CXW1}I-I, CH_REF=BR:XS-PS{6A:CXW1}I-SP-1k, CH_DIFFREF=BR:XS-PS{6A:CXW1}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:XS-PS{6A:CXW1}I:DAC-I, CH_REF=BR:XS-PS{6A:CXW1}I:DAC-I_Ref, CH_TOL=BR:XS-PS{6A:CXW1}I:DAC_I_Tol-SP,  CH_ARCH=BR:XS-PS{6A:CXW1}I:DAC_I_Arch-I, CH_DIFFREF=BR:XS-PS{6A:CXW1}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR:XS-PS{6A:CXW1}I:DAC_I_DiffArch-I, CH_FLG=BR:XS-PS{6A:CXW1}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{6A:CXW1}I:DAC_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{6A:CXW1}I:DAC-I, CH_REF=BR:XS-PS{6A:CXW1}I:DAC-I_Ref, CH_DIFFREF=BR:XS-PS{6A:CXW1}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{6A:CXW1}I:DAC-I, CH_REF=BR:XS-PS{6A:CXW1}I-SP-1k, CH_DIFFREF=BR:XS-PS{6A:CXW1}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:XS-PS{6A:CXW1}E:PS-I, CH_REF=BR:XS-PS{6A:CXW1}E:PS-I_Ref, CH_TOL=BR:XS-PS{6A:CXW1}E:PS_I_Tol-SP, CH_ARCH=BR:XS-PS{6A:CXW1}E:PS_I_Arch-I, CH_DIFFREF=BR:XS-PS{6A:CXW1}E:PS_I_DiffRef-I, CH_DIFFARCH=BR:XS-PS{6A:CXW1}E:PS_I_DiffArch-I, CH_FLG=BR:XS-PS{6A:CXW1}E:PS_I_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{6A:CXW1}E:PS_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{6A:CXW1}E:PS-I, CH_REF=BR:XS-PS{6A:CXW1}E:PS-I_Ref, CH_DIFFREF=BR:XS-PS{6A:CXW1}E:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{6A:CXW1}Cmd:PwrOn-Cmd, CH_REF=BR:XS-PS{6A:CXW1}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:XS-PS{6A:CXW1}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:XS-PS{6A:CXW1}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{6A:CXW1}Cmd:PwrOn_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{6A:CXW1}Cmd:PwrOn-Cmd, CH_REF=BR:XS-PS{6A:CXW1}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:XS-PS{6A:CXW1}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{6A:CXW1}Sts:PSworks-Sts, CH_REF=BR:XS-PS{6A:CXW1}Sts:PSworks-Sts_Ref, CH_ARCH=BR:XS-PS{6A:CXW1}Sts:PSworks_Arch-Sts, CH_FLG=BR:XS-PS{6A:CXW1}Sts:PSworks_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{6A:CXW1}Sts:PSworks_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{6A:CXW1}Sts:PSworks-Sts, CH_REF=BR:XS-PS{6A:CXW1}Sts:PSworks-Sts_Ref, CH_FLG=BR:XS-PS{6A:CXW1}Sts:PSworks_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")


# PSC26 Chan 1
# BR:A2-PS{6A:SF1} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:A2-PS{6A:SF1}I-SP,              OUTPUT=BR{PSC26}DAC:1-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC26}ADC:08-I,    OUTPUT=BR:A2-PS{6A:SF1}I-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC26}ADC:09-I,    OUTPUT=BR:A2-PS{6A:SF1}I:DAC-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC26}ADC:10-I,    OUTPUT=BR:A2-PS{6A:SF1}E:PS-I,      WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:A2-PS{6A:SF1}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC26}DO:0-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC26}DI:00-Sts,   OUTPUT=BR:A2-PS{6A:SF1}Sts:PSworks-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:A2-PS{6A:SF1}I-SP, OUTPUT=BR:A2-PS{6A:SF1}I-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:A2-PS{6A:SF1}I-SP-1k, OUTPUT=BR:A2-PS{6A:SF1}I-SP-1k-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A2-PS{6A:SF1}I-SP-1k, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A2-PS{6A:SF1}I-I,     OUTPUT=BR:A2-PS{6A:SF1}I-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A2-PS{6A:SF1}I-I,     WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A2-PS{6A:SF1}I:DAC-I, OUTPUT=BR:A2-PS{6A:SF1}I:DAC-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A2-PS{6A:SF1}I:DAC-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A2-PS{6A:SF1}E:PS-I,  OUTPUT=BR:A2-PS{6A:SF1}E:PS-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A2-PS{6A:SF1}E:PS-I,  WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A2-PS{6A:SF1}I-SP, CH_REF=BR:A2-PS{6A:SF1}I-SP_Ref, CH_TOL=BR:A2-PS{6A:SF1}I_SP_Tol-SP, CH_ARCH=BR:A2-PS{6A:SF1}I_SP_Arch-I, CH_DIFFREF=BR:A2-PS{6A:SF1}I_SP_DiffRef-I, CH_DIFFARCH=BR:A2-PS{6A:SF1}I_SP_DiffArch-I, CH_FLG=BR:A2-PS{6A:SF1}I_SP_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:SF1}I_SP_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:SF1}I-SP, CH_REF=BR:A2-PS{6A:SF1}I-SP_Ref, CH_DIFFREF=BR:A2-PS{6A:SF1}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A2-PS{6A:SF1}I-I, CH_REF=BR:A2-PS{6A:SF1}I-I_Ref, CH_TOL=BR:A2-PS{6A:SF1}I_I_Tol-SP, CH_ARCH=BR:A2-PS{6A:SF1}I_I_Arch-I, CH_DIFFREF=BR:A2-PS{6A:SF1}I_I_DiffRef-I, CH_DIFFARCH=BR:A2-PS{6A:SF1}I_I_DiffArch-I, CH_FLG=BR:A2-PS{6A:SF1}I_I_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:SF1}I_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:SF1}I-I, CH_REF=BR:A2-PS{6A:SF1}I-I_Ref, CH_DIFFREF=BR:A2-PS{6A:SF1}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:SF1}I-I, CH_REF=BR:A2-PS{6A:SF1}I-SP-1k, CH_DIFFREF=BR:A2-PS{6A:SF1}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A2-PS{6A:SF1}I:DAC-I, CH_REF=BR:A2-PS{6A:SF1}I:DAC-I_Ref, CH_TOL=BR:A2-PS{6A:SF1}I:DAC_I_Tol-SP,  CH_ARCH=BR:A2-PS{6A:SF1}I:DAC_I_Arch-I, CH_DIFFREF=BR:A2-PS{6A:SF1}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR:A2-PS{6A:SF1}I:DAC_I_DiffArch-I, CH_FLG=BR:A2-PS{6A:SF1}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:SF1}I:DAC_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:SF1}I:DAC-I, CH_REF=BR:A2-PS{6A:SF1}I:DAC-I_Ref, CH_DIFFREF=BR:A2-PS{6A:SF1}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:SF1}I:DAC-I, CH_REF=BR:A2-PS{6A:SF1}I-SP-1k, CH_DIFFREF=BR:A2-PS{6A:SF1}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A2-PS{6A:SF1}E:PS-I, CH_REF=BR:A2-PS{6A:SF1}E:PS-I_Ref, CH_TOL=BR:A2-PS{6A:SF1}E:PS_I_Tol-SP, CH_ARCH=BR:A2-PS{6A:SF1}E:PS_I_Arch-I, CH_DIFFREF=BR:A2-PS{6A:SF1}E:PS_I_DiffRef-I, CH_DIFFARCH=BR:A2-PS{6A:SF1}E:PS_I_DiffArch-I, CH_FLG=BR:A2-PS{6A:SF1}E:PS_I_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:SF1}E:PS_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:SF1}E:PS-I, CH_REF=BR:A2-PS{6A:SF1}E:PS-I_Ref, CH_DIFFREF=BR:A2-PS{6A:SF1}E:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A2-PS{6A:SF1}Cmd:PwrOn-Cmd, CH_REF=BR:A2-PS{6A:SF1}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:A2-PS{6A:SF1}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:A2-PS{6A:SF1}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:SF1}Cmd:PwrOn_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A2-PS{6A:SF1}Cmd:PwrOn-Cmd, CH_REF=BR:A2-PS{6A:SF1}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:A2-PS{6A:SF1}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A2-PS{6A:SF1}Sts:PSworks-Sts, CH_REF=BR:A2-PS{6A:SF1}Sts:PSworks-Sts_Ref, CH_ARCH=BR:A2-PS{6A:SF1}Sts:PSworks_Arch-Sts, CH_FLG=BR:A2-PS{6A:SF1}Sts:PSworks_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:SF1}Sts:PSworks_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A2-PS{6A:SF1}Sts:PSworks-Sts, CH_REF=BR:A2-PS{6A:SF1}Sts:PSworks-Sts_Ref, CH_FLG=BR:A2-PS{6A:SF1}Sts:PSworks_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")


# PSC27 Chan 0
# BR:A2-PS{6A:CY1} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:A2-PS{6A:CY1}I-SP,              OUTPUT=BR{PSC27}DAC:0-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC27}ADC:00-I,    OUTPUT=BR:A2-PS{6A:CY1}I-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC27}ADC:01-I,    OUTPUT=BR:A2-PS{6A:CY1}I:DAC-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC27}ADC:02-I,    OUTPUT=BR:A2-PS{6A:CY1}E:PS-I,      WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:A2-PS{6A:CY1}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC27}DO:1-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC27}DI:01-Sts,   OUTPUT=BR:A2-PS{6A:CY1}Sts:PSworks-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:A2-PS{6A:CY1}I-SP, OUTPUT=BR:A2-PS{6A:CY1}I-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:A2-PS{6A:CY1}I-SP-1k, OUTPUT=BR:A2-PS{6A:CY1}I-SP-1k-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A2-PS{6A:CY1}I-SP-1k, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A2-PS{6A:CY1}I-I,     OUTPUT=BR:A2-PS{6A:CY1}I-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A2-PS{6A:CY1}I-I,     WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A2-PS{6A:CY1}I:DAC-I, OUTPUT=BR:A2-PS{6A:CY1}I:DAC-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A2-PS{6A:CY1}I:DAC-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A2-PS{6A:CY1}E:PS-I,  OUTPUT=BR:A2-PS{6A:CY1}E:PS-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A2-PS{6A:CY1}E:PS-I,  WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A2-PS{6A:CY1}I-SP, CH_REF=BR:A2-PS{6A:CY1}I-SP_Ref, CH_TOL=BR:A2-PS{6A:CY1}I_SP_Tol-SP, CH_ARCH=BR:A2-PS{6A:CY1}I_SP_Arch-I, CH_DIFFREF=BR:A2-PS{6A:CY1}I_SP_DiffRef-I, CH_DIFFARCH=BR:A2-PS{6A:CY1}I_SP_DiffArch-I, CH_FLG=BR:A2-PS{6A:CY1}I_SP_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:CY1}I_SP_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:CY1}I-SP, CH_REF=BR:A2-PS{6A:CY1}I-SP_Ref, CH_DIFFREF=BR:A2-PS{6A:CY1}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A2-PS{6A:CY1}I-I, CH_REF=BR:A2-PS{6A:CY1}I-I_Ref, CH_TOL=BR:A2-PS{6A:CY1}I_I_Tol-SP, CH_ARCH=BR:A2-PS{6A:CY1}I_I_Arch-I, CH_DIFFREF=BR:A2-PS{6A:CY1}I_I_DiffRef-I, CH_DIFFARCH=BR:A2-PS{6A:CY1}I_I_DiffArch-I, CH_FLG=BR:A2-PS{6A:CY1}I_I_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:CY1}I_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:CY1}I-I, CH_REF=BR:A2-PS{6A:CY1}I-I_Ref, CH_DIFFREF=BR:A2-PS{6A:CY1}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:CY1}I-I, CH_REF=BR:A2-PS{6A:CY1}I-SP-1k, CH_DIFFREF=BR:A2-PS{6A:CY1}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A2-PS{6A:CY1}I:DAC-I, CH_REF=BR:A2-PS{6A:CY1}I:DAC-I_Ref, CH_TOL=BR:A2-PS{6A:CY1}I:DAC_I_Tol-SP,  CH_ARCH=BR:A2-PS{6A:CY1}I:DAC_I_Arch-I, CH_DIFFREF=BR:A2-PS{6A:CY1}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR:A2-PS{6A:CY1}I:DAC_I_DiffArch-I, CH_FLG=BR:A2-PS{6A:CY1}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:CY1}I:DAC_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:CY1}I:DAC-I, CH_REF=BR:A2-PS{6A:CY1}I:DAC-I_Ref, CH_DIFFREF=BR:A2-PS{6A:CY1}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:CY1}I:DAC-I, CH_REF=BR:A2-PS{6A:CY1}I-SP-1k, CH_DIFFREF=BR:A2-PS{6A:CY1}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A2-PS{6A:CY1}E:PS-I, CH_REF=BR:A2-PS{6A:CY1}E:PS-I_Ref, CH_TOL=BR:A2-PS{6A:CY1}E:PS_I_Tol-SP, CH_ARCH=BR:A2-PS{6A:CY1}E:PS_I_Arch-I, CH_DIFFREF=BR:A2-PS{6A:CY1}E:PS_I_DiffRef-I, CH_DIFFARCH=BR:A2-PS{6A:CY1}E:PS_I_DiffArch-I, CH_FLG=BR:A2-PS{6A:CY1}E:PS_I_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:CY1}E:PS_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:CY1}E:PS-I, CH_REF=BR:A2-PS{6A:CY1}E:PS-I_Ref, CH_DIFFREF=BR:A2-PS{6A:CY1}E:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A2-PS{6A:CY1}Cmd:PwrOn-Cmd, CH_REF=BR:A2-PS{6A:CY1}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:A2-PS{6A:CY1}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:A2-PS{6A:CY1}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:CY1}Cmd:PwrOn_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A2-PS{6A:CY1}Cmd:PwrOn-Cmd, CH_REF=BR:A2-PS{6A:CY1}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:A2-PS{6A:CY1}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A2-PS{6A:CY1}Sts:PSworks-Sts, CH_REF=BR:A2-PS{6A:CY1}Sts:PSworks-Sts_Ref, CH_ARCH=BR:A2-PS{6A:CY1}Sts:PSworks_Arch-Sts, CH_FLG=BR:A2-PS{6A:CY1}Sts:PSworks_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:CY1}Sts:PSworks_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A2-PS{6A:CY1}Sts:PSworks-Sts, CH_REF=BR:A2-PS{6A:CY1}Sts:PSworks-Sts_Ref, CH_FLG=BR:A2-PS{6A:CY1}Sts:PSworks_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")


# PSC27 Chan 1
# BR:A2-PS{6A:CY2} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:A2-PS{6A:CY2}I-SP,              OUTPUT=BR{PSC27}DAC:1-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC27}ADC:08-I,    OUTPUT=BR:A2-PS{6A:CY2}I-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC27}ADC:09-I,    OUTPUT=BR:A2-PS{6A:CY2}I:DAC-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC27}ADC:10-I,    OUTPUT=BR:A2-PS{6A:CY2}E:PS-I,      WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:A2-PS{6A:CY2}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC27}DO:0-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC27}DI:00-Sts,   OUTPUT=BR:A2-PS{6A:CY2}Sts:PSworks-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:A2-PS{6A:CY2}I-SP, OUTPUT=BR:A2-PS{6A:CY2}I-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:A2-PS{6A:CY2}I-SP-1k, OUTPUT=BR:A2-PS{6A:CY2}I-SP-1k-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A2-PS{6A:CY2}I-SP-1k, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A2-PS{6A:CY2}I-I,     OUTPUT=BR:A2-PS{6A:CY2}I-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A2-PS{6A:CY2}I-I,     WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A2-PS{6A:CY2}I:DAC-I, OUTPUT=BR:A2-PS{6A:CY2}I:DAC-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A2-PS{6A:CY2}I:DAC-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A2-PS{6A:CY2}E:PS-I,  OUTPUT=BR:A2-PS{6A:CY2}E:PS-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A2-PS{6A:CY2}E:PS-I,  WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A2-PS{6A:CY2}I-SP, CH_REF=BR:A2-PS{6A:CY2}I-SP_Ref, CH_TOL=BR:A2-PS{6A:CY2}I_SP_Tol-SP, CH_ARCH=BR:A2-PS{6A:CY2}I_SP_Arch-I, CH_DIFFREF=BR:A2-PS{6A:CY2}I_SP_DiffRef-I, CH_DIFFARCH=BR:A2-PS{6A:CY2}I_SP_DiffArch-I, CH_FLG=BR:A2-PS{6A:CY2}I_SP_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:CY2}I_SP_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:CY2}I-SP, CH_REF=BR:A2-PS{6A:CY2}I-SP_Ref, CH_DIFFREF=BR:A2-PS{6A:CY2}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A2-PS{6A:CY2}I-I, CH_REF=BR:A2-PS{6A:CY2}I-I_Ref, CH_TOL=BR:A2-PS{6A:CY2}I_I_Tol-SP, CH_ARCH=BR:A2-PS{6A:CY2}I_I_Arch-I, CH_DIFFREF=BR:A2-PS{6A:CY2}I_I_DiffRef-I, CH_DIFFARCH=BR:A2-PS{6A:CY2}I_I_DiffArch-I, CH_FLG=BR:A2-PS{6A:CY2}I_I_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:CY2}I_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:CY2}I-I, CH_REF=BR:A2-PS{6A:CY2}I-I_Ref, CH_DIFFREF=BR:A2-PS{6A:CY2}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:CY2}I-I, CH_REF=BR:A2-PS{6A:CY2}I-SP-1k, CH_DIFFREF=BR:A2-PS{6A:CY2}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A2-PS{6A:CY2}I:DAC-I, CH_REF=BR:A2-PS{6A:CY2}I:DAC-I_Ref, CH_TOL=BR:A2-PS{6A:CY2}I:DAC_I_Tol-SP,  CH_ARCH=BR:A2-PS{6A:CY2}I:DAC_I_Arch-I, CH_DIFFREF=BR:A2-PS{6A:CY2}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR:A2-PS{6A:CY2}I:DAC_I_DiffArch-I, CH_FLG=BR:A2-PS{6A:CY2}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:CY2}I:DAC_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:CY2}I:DAC-I, CH_REF=BR:A2-PS{6A:CY2}I:DAC-I_Ref, CH_DIFFREF=BR:A2-PS{6A:CY2}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:CY2}I:DAC-I, CH_REF=BR:A2-PS{6A:CY2}I-SP-1k, CH_DIFFREF=BR:A2-PS{6A:CY2}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A2-PS{6A:CY2}E:PS-I, CH_REF=BR:A2-PS{6A:CY2}E:PS-I_Ref, CH_TOL=BR:A2-PS{6A:CY2}E:PS_I_Tol-SP, CH_ARCH=BR:A2-PS{6A:CY2}E:PS_I_Arch-I, CH_DIFFREF=BR:A2-PS{6A:CY2}E:PS_I_DiffRef-I, CH_DIFFARCH=BR:A2-PS{6A:CY2}E:PS_I_DiffArch-I, CH_FLG=BR:A2-PS{6A:CY2}E:PS_I_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:CY2}E:PS_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:CY2}E:PS-I, CH_REF=BR:A2-PS{6A:CY2}E:PS-I_Ref, CH_DIFFREF=BR:A2-PS{6A:CY2}E:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A2-PS{6A:CY2}Cmd:PwrOn-Cmd, CH_REF=BR:A2-PS{6A:CY2}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:A2-PS{6A:CY2}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:A2-PS{6A:CY2}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:CY2}Cmd:PwrOn_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A2-PS{6A:CY2}Cmd:PwrOn-Cmd, CH_REF=BR:A2-PS{6A:CY2}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:A2-PS{6A:CY2}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A2-PS{6A:CY2}Sts:PSworks-Sts, CH_REF=BR:A2-PS{6A:CY2}Sts:PSworks-Sts_Ref, CH_ARCH=BR:A2-PS{6A:CY2}Sts:PSworks_Arch-Sts, CH_FLG=BR:A2-PS{6A:CY2}Sts:PSworks_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:CY2}Sts:PSworks_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A2-PS{6A:CY2}Sts:PSworks-Sts, CH_REF=BR:A2-PS{6A:CY2}Sts:PSworks-Sts_Ref, CH_FLG=BR:A2-PS{6A:CY2}Sts:PSworks_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")


# PSC28 Chan 0
# BR:A2-PS{6A:CY3} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:A2-PS{6A:CY3}I-SP,              OUTPUT=BR{PSC28}DAC:0-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC28}ADC:00-I,    OUTPUT=BR:A2-PS{6A:CY3}I-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC28}ADC:01-I,    OUTPUT=BR:A2-PS{6A:CY3}I:DAC-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC28}ADC:02-I,    OUTPUT=BR:A2-PS{6A:CY3}E:PS-I,      WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:A2-PS{6A:CY3}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC28}DO:1-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC28}DI:01-Sts,   OUTPUT=BR:A2-PS{6A:CY3}Sts:PSworks-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:A2-PS{6A:CY3}I-SP, OUTPUT=BR:A2-PS{6A:CY3}I-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:A2-PS{6A:CY3}I-SP-1k, OUTPUT=BR:A2-PS{6A:CY3}I-SP-1k-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A2-PS{6A:CY3}I-SP-1k, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A2-PS{6A:CY3}I-I,     OUTPUT=BR:A2-PS{6A:CY3}I-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A2-PS{6A:CY3}I-I,     WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A2-PS{6A:CY3}I:DAC-I, OUTPUT=BR:A2-PS{6A:CY3}I:DAC-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A2-PS{6A:CY3}I:DAC-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A2-PS{6A:CY3}E:PS-I,  OUTPUT=BR:A2-PS{6A:CY3}E:PS-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A2-PS{6A:CY3}E:PS-I,  WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A2-PS{6A:CY3}I-SP, CH_REF=BR:A2-PS{6A:CY3}I-SP_Ref, CH_TOL=BR:A2-PS{6A:CY3}I_SP_Tol-SP, CH_ARCH=BR:A2-PS{6A:CY3}I_SP_Arch-I, CH_DIFFREF=BR:A2-PS{6A:CY3}I_SP_DiffRef-I, CH_DIFFARCH=BR:A2-PS{6A:CY3}I_SP_DiffArch-I, CH_FLG=BR:A2-PS{6A:CY3}I_SP_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:CY3}I_SP_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:CY3}I-SP, CH_REF=BR:A2-PS{6A:CY3}I-SP_Ref, CH_DIFFREF=BR:A2-PS{6A:CY3}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A2-PS{6A:CY3}I-I, CH_REF=BR:A2-PS{6A:CY3}I-I_Ref, CH_TOL=BR:A2-PS{6A:CY3}I_I_Tol-SP, CH_ARCH=BR:A2-PS{6A:CY3}I_I_Arch-I, CH_DIFFREF=BR:A2-PS{6A:CY3}I_I_DiffRef-I, CH_DIFFARCH=BR:A2-PS{6A:CY3}I_I_DiffArch-I, CH_FLG=BR:A2-PS{6A:CY3}I_I_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:CY3}I_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:CY3}I-I, CH_REF=BR:A2-PS{6A:CY3}I-I_Ref, CH_DIFFREF=BR:A2-PS{6A:CY3}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:CY3}I-I, CH_REF=BR:A2-PS{6A:CY3}I-SP-1k, CH_DIFFREF=BR:A2-PS{6A:CY3}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A2-PS{6A:CY3}I:DAC-I, CH_REF=BR:A2-PS{6A:CY3}I:DAC-I_Ref, CH_TOL=BR:A2-PS{6A:CY3}I:DAC_I_Tol-SP,  CH_ARCH=BR:A2-PS{6A:CY3}I:DAC_I_Arch-I, CH_DIFFREF=BR:A2-PS{6A:CY3}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR:A2-PS{6A:CY3}I:DAC_I_DiffArch-I, CH_FLG=BR:A2-PS{6A:CY3}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:CY3}I:DAC_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:CY3}I:DAC-I, CH_REF=BR:A2-PS{6A:CY3}I:DAC-I_Ref, CH_DIFFREF=BR:A2-PS{6A:CY3}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:CY3}I:DAC-I, CH_REF=BR:A2-PS{6A:CY3}I-SP-1k, CH_DIFFREF=BR:A2-PS{6A:CY3}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A2-PS{6A:CY3}E:PS-I, CH_REF=BR:A2-PS{6A:CY3}E:PS-I_Ref, CH_TOL=BR:A2-PS{6A:CY3}E:PS_I_Tol-SP, CH_ARCH=BR:A2-PS{6A:CY3}E:PS_I_Arch-I, CH_DIFFREF=BR:A2-PS{6A:CY3}E:PS_I_DiffRef-I, CH_DIFFARCH=BR:A2-PS{6A:CY3}E:PS_I_DiffArch-I, CH_FLG=BR:A2-PS{6A:CY3}E:PS_I_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:CY3}E:PS_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:CY3}E:PS-I, CH_REF=BR:A2-PS{6A:CY3}E:PS-I_Ref, CH_DIFFREF=BR:A2-PS{6A:CY3}E:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A2-PS{6A:CY3}Cmd:PwrOn-Cmd, CH_REF=BR:A2-PS{6A:CY3}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:A2-PS{6A:CY3}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:A2-PS{6A:CY3}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:CY3}Cmd:PwrOn_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A2-PS{6A:CY3}Cmd:PwrOn-Cmd, CH_REF=BR:A2-PS{6A:CY3}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:A2-PS{6A:CY3}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A2-PS{6A:CY3}Sts:PSworks-Sts, CH_REF=BR:A2-PS{6A:CY3}Sts:PSworks-Sts_Ref, CH_ARCH=BR:A2-PS{6A:CY3}Sts:PSworks_Arch-Sts, CH_FLG=BR:A2-PS{6A:CY3}Sts:PSworks_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:CY3}Sts:PSworks_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A2-PS{6A:CY3}Sts:PSworks-Sts, CH_REF=BR:A2-PS{6A:CY3}Sts:PSworks-Sts_Ref, CH_FLG=BR:A2-PS{6A:CY3}Sts:PSworks_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")


# PSC28 Chan 1
# BR:A2-PS{6A:CY4} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:A2-PS{6A:CY4}I-SP,              OUTPUT=BR{PSC28}DAC:1-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC28}ADC:08-I,    OUTPUT=BR:A2-PS{6A:CY4}I-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC28}ADC:09-I,    OUTPUT=BR:A2-PS{6A:CY4}I:DAC-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC28}ADC:10-I,    OUTPUT=BR:A2-PS{6A:CY4}E:PS-I,      WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:A2-PS{6A:CY4}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC28}DO:0-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC28}DI:00-Sts,   OUTPUT=BR:A2-PS{6A:CY4}Sts:PSworks-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:A2-PS{6A:CY4}I-SP, OUTPUT=BR:A2-PS{6A:CY4}I-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:A2-PS{6A:CY4}I-SP-1k, OUTPUT=BR:A2-PS{6A:CY4}I-SP-1k-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A2-PS{6A:CY4}I-SP-1k, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A2-PS{6A:CY4}I-I,     OUTPUT=BR:A2-PS{6A:CY4}I-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A2-PS{6A:CY4}I-I,     WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A2-PS{6A:CY4}I:DAC-I, OUTPUT=BR:A2-PS{6A:CY4}I:DAC-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A2-PS{6A:CY4}I:DAC-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A2-PS{6A:CY4}E:PS-I,  OUTPUT=BR:A2-PS{6A:CY4}E:PS-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A2-PS{6A:CY4}E:PS-I,  WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A2-PS{6A:CY4}I-SP, CH_REF=BR:A2-PS{6A:CY4}I-SP_Ref, CH_TOL=BR:A2-PS{6A:CY4}I_SP_Tol-SP, CH_ARCH=BR:A2-PS{6A:CY4}I_SP_Arch-I, CH_DIFFREF=BR:A2-PS{6A:CY4}I_SP_DiffRef-I, CH_DIFFARCH=BR:A2-PS{6A:CY4}I_SP_DiffArch-I, CH_FLG=BR:A2-PS{6A:CY4}I_SP_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:CY4}I_SP_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:CY4}I-SP, CH_REF=BR:A2-PS{6A:CY4}I-SP_Ref, CH_DIFFREF=BR:A2-PS{6A:CY4}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A2-PS{6A:CY4}I-I, CH_REF=BR:A2-PS{6A:CY4}I-I_Ref, CH_TOL=BR:A2-PS{6A:CY4}I_I_Tol-SP, CH_ARCH=BR:A2-PS{6A:CY4}I_I_Arch-I, CH_DIFFREF=BR:A2-PS{6A:CY4}I_I_DiffRef-I, CH_DIFFARCH=BR:A2-PS{6A:CY4}I_I_DiffArch-I, CH_FLG=BR:A2-PS{6A:CY4}I_I_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:CY4}I_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:CY4}I-I, CH_REF=BR:A2-PS{6A:CY4}I-I_Ref, CH_DIFFREF=BR:A2-PS{6A:CY4}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:CY4}I-I, CH_REF=BR:A2-PS{6A:CY4}I-SP-1k, CH_DIFFREF=BR:A2-PS{6A:CY4}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A2-PS{6A:CY4}I:DAC-I, CH_REF=BR:A2-PS{6A:CY4}I:DAC-I_Ref, CH_TOL=BR:A2-PS{6A:CY4}I:DAC_I_Tol-SP,  CH_ARCH=BR:A2-PS{6A:CY4}I:DAC_I_Arch-I, CH_DIFFREF=BR:A2-PS{6A:CY4}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR:A2-PS{6A:CY4}I:DAC_I_DiffArch-I, CH_FLG=BR:A2-PS{6A:CY4}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:CY4}I:DAC_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:CY4}I:DAC-I, CH_REF=BR:A2-PS{6A:CY4}I:DAC-I_Ref, CH_DIFFREF=BR:A2-PS{6A:CY4}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:CY4}I:DAC-I, CH_REF=BR:A2-PS{6A:CY4}I-SP-1k, CH_DIFFREF=BR:A2-PS{6A:CY4}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A2-PS{6A:CY4}E:PS-I, CH_REF=BR:A2-PS{6A:CY4}E:PS-I_Ref, CH_TOL=BR:A2-PS{6A:CY4}E:PS_I_Tol-SP, CH_ARCH=BR:A2-PS{6A:CY4}E:PS_I_Arch-I, CH_DIFFREF=BR:A2-PS{6A:CY4}E:PS_I_DiffRef-I, CH_DIFFARCH=BR:A2-PS{6A:CY4}E:PS_I_DiffArch-I, CH_FLG=BR:A2-PS{6A:CY4}E:PS_I_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:CY4}E:PS_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:CY4}E:PS-I, CH_REF=BR:A2-PS{6A:CY4}E:PS-I_Ref, CH_DIFFREF=BR:A2-PS{6A:CY4}E:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A2-PS{6A:CY4}Cmd:PwrOn-Cmd, CH_REF=BR:A2-PS{6A:CY4}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:A2-PS{6A:CY4}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:A2-PS{6A:CY4}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:CY4}Cmd:PwrOn_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A2-PS{6A:CY4}Cmd:PwrOn-Cmd, CH_REF=BR:A2-PS{6A:CY4}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:A2-PS{6A:CY4}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A2-PS{6A:CY4}Sts:PSworks-Sts, CH_REF=BR:A2-PS{6A:CY4}Sts:PSworks-Sts_Ref, CH_ARCH=BR:A2-PS{6A:CY4}Sts:PSworks_Arch-Sts, CH_FLG=BR:A2-PS{6A:CY4}Sts:PSworks_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:CY4}Sts:PSworks_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A2-PS{6A:CY4}Sts:PSworks-Sts, CH_REF=BR:A2-PS{6A:CY4}Sts:PSworks-Sts_Ref, CH_FLG=BR:A2-PS{6A:CY4}Sts:PSworks_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")


# PSC29 Chan 0
# BR:A2-PS{6A:SD1} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:A2-PS{6A:SD1}I-SP,              OUTPUT=BR{PSC29}DAC:0-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC29}ADC:00-I,    OUTPUT=BR:A2-PS{6A:SD1}I-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC29}ADC:01-I,    OUTPUT=BR:A2-PS{6A:SD1}I:DAC-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC29}ADC:02-I,    OUTPUT=BR:A2-PS{6A:SD1}E:PS-I,      WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:A2-PS{6A:SD1}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC29}DO:1-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC29}DI:01-Sts,   OUTPUT=BR:A2-PS{6A:SD1}Sts:PSworks-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:A2-PS{6A:SD1}I-SP, OUTPUT=BR:A2-PS{6A:SD1}I-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:A2-PS{6A:SD1}I-SP-1k, OUTPUT=BR:A2-PS{6A:SD1}I-SP-1k-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A2-PS{6A:SD1}I-SP-1k, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A2-PS{6A:SD1}I-I,     OUTPUT=BR:A2-PS{6A:SD1}I-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A2-PS{6A:SD1}I-I,     WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A2-PS{6A:SD1}I:DAC-I, OUTPUT=BR:A2-PS{6A:SD1}I:DAC-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A2-PS{6A:SD1}I:DAC-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A2-PS{6A:SD1}E:PS-I,  OUTPUT=BR:A2-PS{6A:SD1}E:PS-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A2-PS{6A:SD1}E:PS-I,  WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A2-PS{6A:SD1}I-SP, CH_REF=BR:A2-PS{6A:SD1}I-SP_Ref, CH_TOL=BR:A2-PS{6A:SD1}I_SP_Tol-SP, CH_ARCH=BR:A2-PS{6A:SD1}I_SP_Arch-I, CH_DIFFREF=BR:A2-PS{6A:SD1}I_SP_DiffRef-I, CH_DIFFARCH=BR:A2-PS{6A:SD1}I_SP_DiffArch-I, CH_FLG=BR:A2-PS{6A:SD1}I_SP_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:SD1}I_SP_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:SD1}I-SP, CH_REF=BR:A2-PS{6A:SD1}I-SP_Ref, CH_DIFFREF=BR:A2-PS{6A:SD1}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A2-PS{6A:SD1}I-I, CH_REF=BR:A2-PS{6A:SD1}I-I_Ref, CH_TOL=BR:A2-PS{6A:SD1}I_I_Tol-SP, CH_ARCH=BR:A2-PS{6A:SD1}I_I_Arch-I, CH_DIFFREF=BR:A2-PS{6A:SD1}I_I_DiffRef-I, CH_DIFFARCH=BR:A2-PS{6A:SD1}I_I_DiffArch-I, CH_FLG=BR:A2-PS{6A:SD1}I_I_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:SD1}I_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:SD1}I-I, CH_REF=BR:A2-PS{6A:SD1}I-I_Ref, CH_DIFFREF=BR:A2-PS{6A:SD1}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:SD1}I-I, CH_REF=BR:A2-PS{6A:SD1}I-SP-1k, CH_DIFFREF=BR:A2-PS{6A:SD1}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A2-PS{6A:SD1}I:DAC-I, CH_REF=BR:A2-PS{6A:SD1}I:DAC-I_Ref, CH_TOL=BR:A2-PS{6A:SD1}I:DAC_I_Tol-SP,  CH_ARCH=BR:A2-PS{6A:SD1}I:DAC_I_Arch-I, CH_DIFFREF=BR:A2-PS{6A:SD1}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR:A2-PS{6A:SD1}I:DAC_I_DiffArch-I, CH_FLG=BR:A2-PS{6A:SD1}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:SD1}I:DAC_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:SD1}I:DAC-I, CH_REF=BR:A2-PS{6A:SD1}I:DAC-I_Ref, CH_DIFFREF=BR:A2-PS{6A:SD1}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:SD1}I:DAC-I, CH_REF=BR:A2-PS{6A:SD1}I-SP-1k, CH_DIFFREF=BR:A2-PS{6A:SD1}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A2-PS{6A:SD1}E:PS-I, CH_REF=BR:A2-PS{6A:SD1}E:PS-I_Ref, CH_TOL=BR:A2-PS{6A:SD1}E:PS_I_Tol-SP, CH_ARCH=BR:A2-PS{6A:SD1}E:PS_I_Arch-I, CH_DIFFREF=BR:A2-PS{6A:SD1}E:PS_I_DiffRef-I, CH_DIFFARCH=BR:A2-PS{6A:SD1}E:PS_I_DiffArch-I, CH_FLG=BR:A2-PS{6A:SD1}E:PS_I_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:SD1}E:PS_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:SD1}E:PS-I, CH_REF=BR:A2-PS{6A:SD1}E:PS-I_Ref, CH_DIFFREF=BR:A2-PS{6A:SD1}E:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A2-PS{6A:SD1}Cmd:PwrOn-Cmd, CH_REF=BR:A2-PS{6A:SD1}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:A2-PS{6A:SD1}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:A2-PS{6A:SD1}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:SD1}Cmd:PwrOn_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A2-PS{6A:SD1}Cmd:PwrOn-Cmd, CH_REF=BR:A2-PS{6A:SD1}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:A2-PS{6A:SD1}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A2-PS{6A:SD1}Sts:PSworks-Sts, CH_REF=BR:A2-PS{6A:SD1}Sts:PSworks-Sts_Ref, CH_ARCH=BR:A2-PS{6A:SD1}Sts:PSworks_Arch-Sts, CH_FLG=BR:A2-PS{6A:SD1}Sts:PSworks_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:SD1}Sts:PSworks_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A2-PS{6A:SD1}Sts:PSworks-Sts, CH_REF=BR:A2-PS{6A:SD1}Sts:PSworks-Sts_Ref, CH_FLG=BR:A2-PS{6A:SD1}Sts:PSworks_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")


# PSC29 Chan 1
# BR:A2-PS{6A:SD2} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:A2-PS{6A:SD2}I-SP,              OUTPUT=BR{PSC29}DAC:1-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC29}ADC:08-I,    OUTPUT=BR:A2-PS{6A:SD2}I-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC29}ADC:09-I,    OUTPUT=BR:A2-PS{6A:SD2}I:DAC-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC29}ADC:10-I,    OUTPUT=BR:A2-PS{6A:SD2}E:PS-I,      WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:A2-PS{6A:SD2}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC29}DO:0-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC29}DI:00-Sts,   OUTPUT=BR:A2-PS{6A:SD2}Sts:PSworks-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:A2-PS{6A:SD2}I-SP, OUTPUT=BR:A2-PS{6A:SD2}I-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:A2-PS{6A:SD2}I-SP-1k, OUTPUT=BR:A2-PS{6A:SD2}I-SP-1k-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A2-PS{6A:SD2}I-SP-1k, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A2-PS{6A:SD2}I-I,     OUTPUT=BR:A2-PS{6A:SD2}I-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A2-PS{6A:SD2}I-I,     WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A2-PS{6A:SD2}I:DAC-I, OUTPUT=BR:A2-PS{6A:SD2}I:DAC-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A2-PS{6A:SD2}I:DAC-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A2-PS{6A:SD2}E:PS-I,  OUTPUT=BR:A2-PS{6A:SD2}E:PS-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A2-PS{6A:SD2}E:PS-I,  WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A2-PS{6A:SD2}I-SP, CH_REF=BR:A2-PS{6A:SD2}I-SP_Ref, CH_TOL=BR:A2-PS{6A:SD2}I_SP_Tol-SP, CH_ARCH=BR:A2-PS{6A:SD2}I_SP_Arch-I, CH_DIFFREF=BR:A2-PS{6A:SD2}I_SP_DiffRef-I, CH_DIFFARCH=BR:A2-PS{6A:SD2}I_SP_DiffArch-I, CH_FLG=BR:A2-PS{6A:SD2}I_SP_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:SD2}I_SP_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:SD2}I-SP, CH_REF=BR:A2-PS{6A:SD2}I-SP_Ref, CH_DIFFREF=BR:A2-PS{6A:SD2}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A2-PS{6A:SD2}I-I, CH_REF=BR:A2-PS{6A:SD2}I-I_Ref, CH_TOL=BR:A2-PS{6A:SD2}I_I_Tol-SP, CH_ARCH=BR:A2-PS{6A:SD2}I_I_Arch-I, CH_DIFFREF=BR:A2-PS{6A:SD2}I_I_DiffRef-I, CH_DIFFARCH=BR:A2-PS{6A:SD2}I_I_DiffArch-I, CH_FLG=BR:A2-PS{6A:SD2}I_I_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:SD2}I_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:SD2}I-I, CH_REF=BR:A2-PS{6A:SD2}I-I_Ref, CH_DIFFREF=BR:A2-PS{6A:SD2}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:SD2}I-I, CH_REF=BR:A2-PS{6A:SD2}I-SP-1k, CH_DIFFREF=BR:A2-PS{6A:SD2}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A2-PS{6A:SD2}I:DAC-I, CH_REF=BR:A2-PS{6A:SD2}I:DAC-I_Ref, CH_TOL=BR:A2-PS{6A:SD2}I:DAC_I_Tol-SP,  CH_ARCH=BR:A2-PS{6A:SD2}I:DAC_I_Arch-I, CH_DIFFREF=BR:A2-PS{6A:SD2}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR:A2-PS{6A:SD2}I:DAC_I_DiffArch-I, CH_FLG=BR:A2-PS{6A:SD2}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:SD2}I:DAC_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:SD2}I:DAC-I, CH_REF=BR:A2-PS{6A:SD2}I:DAC-I_Ref, CH_DIFFREF=BR:A2-PS{6A:SD2}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:SD2}I:DAC-I, CH_REF=BR:A2-PS{6A:SD2}I-SP-1k, CH_DIFFREF=BR:A2-PS{6A:SD2}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A2-PS{6A:SD2}E:PS-I, CH_REF=BR:A2-PS{6A:SD2}E:PS-I_Ref, CH_TOL=BR:A2-PS{6A:SD2}E:PS_I_Tol-SP, CH_ARCH=BR:A2-PS{6A:SD2}E:PS_I_Arch-I, CH_DIFFREF=BR:A2-PS{6A:SD2}E:PS_I_DiffRef-I, CH_DIFFARCH=BR:A2-PS{6A:SD2}E:PS_I_DiffArch-I, CH_FLG=BR:A2-PS{6A:SD2}E:PS_I_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:SD2}E:PS_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:SD2}E:PS-I, CH_REF=BR:A2-PS{6A:SD2}E:PS-I_Ref, CH_DIFFREF=BR:A2-PS{6A:SD2}E:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A2-PS{6A:SD2}Cmd:PwrOn-Cmd, CH_REF=BR:A2-PS{6A:SD2}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:A2-PS{6A:SD2}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:A2-PS{6A:SD2}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:SD2}Cmd:PwrOn_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A2-PS{6A:SD2}Cmd:PwrOn-Cmd, CH_REF=BR:A2-PS{6A:SD2}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:A2-PS{6A:SD2}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A2-PS{6A:SD2}Sts:PSworks-Sts, CH_REF=BR:A2-PS{6A:SD2}Sts:PSworks-Sts_Ref, CH_ARCH=BR:A2-PS{6A:SD2}Sts:PSworks_Arch-Sts, CH_FLG=BR:A2-PS{6A:SD2}Sts:PSworks_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:SD2}Sts:PSworks_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A2-PS{6A:SD2}Sts:PSworks-Sts, CH_REF=BR:A2-PS{6A:SD2}Sts:PSworks-Sts_Ref, CH_FLG=BR:A2-PS{6A:SD2}Sts:PSworks_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")


# PSC30 Chan 0
# BR:A2-PS{6A:SF2} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:A2-PS{6A:SF2}I-SP,              OUTPUT=BR{PSC30}DAC:0-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC30}ADC:00-I,    OUTPUT=BR:A2-PS{6A:SF2}I-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC30}ADC:01-I,    OUTPUT=BR:A2-PS{6A:SF2}I:DAC-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC30}ADC:02-I,    OUTPUT=BR:A2-PS{6A:SF2}E:PS-I,      WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:A2-PS{6A:SF2}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC30}DO:1-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC30}DI:01-Sts,   OUTPUT=BR:A2-PS{6A:SF2}Sts:PSworks-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:A2-PS{6A:SF2}I-SP, OUTPUT=BR:A2-PS{6A:SF2}I-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:A2-PS{6A:SF2}I-SP-1k, OUTPUT=BR:A2-PS{6A:SF2}I-SP-1k-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A2-PS{6A:SF2}I-SP-1k, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A2-PS{6A:SF2}I-I,     OUTPUT=BR:A2-PS{6A:SF2}I-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A2-PS{6A:SF2}I-I,     WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A2-PS{6A:SF2}I:DAC-I, OUTPUT=BR:A2-PS{6A:SF2}I:DAC-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A2-PS{6A:SF2}I:DAC-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A2-PS{6A:SF2}E:PS-I,  OUTPUT=BR:A2-PS{6A:SF2}E:PS-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A2-PS{6A:SF2}E:PS-I,  WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A2-PS{6A:SF2}I-SP, CH_REF=BR:A2-PS{6A:SF2}I-SP_Ref, CH_TOL=BR:A2-PS{6A:SF2}I_SP_Tol-SP, CH_ARCH=BR:A2-PS{6A:SF2}I_SP_Arch-I, CH_DIFFREF=BR:A2-PS{6A:SF2}I_SP_DiffRef-I, CH_DIFFARCH=BR:A2-PS{6A:SF2}I_SP_DiffArch-I, CH_FLG=BR:A2-PS{6A:SF2}I_SP_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:SF2}I_SP_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:SF2}I-SP, CH_REF=BR:A2-PS{6A:SF2}I-SP_Ref, CH_DIFFREF=BR:A2-PS{6A:SF2}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A2-PS{6A:SF2}I-I, CH_REF=BR:A2-PS{6A:SF2}I-I_Ref, CH_TOL=BR:A2-PS{6A:SF2}I_I_Tol-SP, CH_ARCH=BR:A2-PS{6A:SF2}I_I_Arch-I, CH_DIFFREF=BR:A2-PS{6A:SF2}I_I_DiffRef-I, CH_DIFFARCH=BR:A2-PS{6A:SF2}I_I_DiffArch-I, CH_FLG=BR:A2-PS{6A:SF2}I_I_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:SF2}I_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:SF2}I-I, CH_REF=BR:A2-PS{6A:SF2}I-I_Ref, CH_DIFFREF=BR:A2-PS{6A:SF2}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:SF2}I-I, CH_REF=BR:A2-PS{6A:SF2}I-SP-1k, CH_DIFFREF=BR:A2-PS{6A:SF2}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A2-PS{6A:SF2}I:DAC-I, CH_REF=BR:A2-PS{6A:SF2}I:DAC-I_Ref, CH_TOL=BR:A2-PS{6A:SF2}I:DAC_I_Tol-SP,  CH_ARCH=BR:A2-PS{6A:SF2}I:DAC_I_Arch-I, CH_DIFFREF=BR:A2-PS{6A:SF2}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR:A2-PS{6A:SF2}I:DAC_I_DiffArch-I, CH_FLG=BR:A2-PS{6A:SF2}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:SF2}I:DAC_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:SF2}I:DAC-I, CH_REF=BR:A2-PS{6A:SF2}I:DAC-I_Ref, CH_DIFFREF=BR:A2-PS{6A:SF2}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:SF2}I:DAC-I, CH_REF=BR:A2-PS{6A:SF2}I-SP-1k, CH_DIFFREF=BR:A2-PS{6A:SF2}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A2-PS{6A:SF2}E:PS-I, CH_REF=BR:A2-PS{6A:SF2}E:PS-I_Ref, CH_TOL=BR:A2-PS{6A:SF2}E:PS_I_Tol-SP, CH_ARCH=BR:A2-PS{6A:SF2}E:PS_I_Arch-I, CH_DIFFREF=BR:A2-PS{6A:SF2}E:PS_I_DiffRef-I, CH_DIFFARCH=BR:A2-PS{6A:SF2}E:PS_I_DiffArch-I, CH_FLG=BR:A2-PS{6A:SF2}E:PS_I_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:SF2}E:PS_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A2-PS{6A:SF2}E:PS-I, CH_REF=BR:A2-PS{6A:SF2}E:PS-I_Ref, CH_DIFFREF=BR:A2-PS{6A:SF2}E:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A2-PS{6A:SF2}Cmd:PwrOn-Cmd, CH_REF=BR:A2-PS{6A:SF2}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:A2-PS{6A:SF2}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:A2-PS{6A:SF2}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:SF2}Cmd:PwrOn_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A2-PS{6A:SF2}Cmd:PwrOn-Cmd, CH_REF=BR:A2-PS{6A:SF2}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:A2-PS{6A:SF2}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A2-PS{6A:SF2}Sts:PSworks-Sts, CH_REF=BR:A2-PS{6A:SF2}Sts:PSworks-Sts_Ref, CH_ARCH=BR:A2-PS{6A:SF2}Sts:PSworks_Arch-Sts, CH_FLG=BR:A2-PS{6A:SF2}Sts:PSworks_MonitFlg-Sts, CH_FLGARCH=BR:A2-PS{6A:SF2}Sts:PSworks_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A2-PS{6A:SF2}Sts:PSworks-Sts, CH_REF=BR:A2-PS{6A:SF2}Sts:PSworks-Sts_Ref, CH_FLG=BR:A2-PS{6A:SF2}Sts:PSworks_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")


# PSC30 Channel: 1  no PS

# PSC31 Chan 0
# BR:CS-PS{6A:CXW2} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:CS-PS{6A:CXW2}I-SP,              OUTPUT=BR{PSC31}DAC:0-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC31}ADC:00-I,    OUTPUT=BR:CS-PS{6A:CXW2}I-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC31}ADC:01-I,    OUTPUT=BR:CS-PS{6A:CXW2}I:DAC-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC31}ADC:02-I,    OUTPUT=BR:CS-PS{6A:CXW2}E:PS-I,      WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:CS-PS{6A:CXW2}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC31}DO:1-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC31}DI:01-Sts,   OUTPUT=BR:CS-PS{6A:CXW2}Sts:PSworks-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:CS-PS{6A:CXW2}I-SP, OUTPUT=BR:CS-PS{6A:CXW2}I-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:CS-PS{6A:CXW2}I-SP-1k, OUTPUT=BR:CS-PS{6A:CXW2}I-SP-1k-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:CS-PS{6A:CXW2}I-SP-1k, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:CS-PS{6A:CXW2}I-I,     OUTPUT=BR:CS-PS{6A:CXW2}I-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:CS-PS{6A:CXW2}I-I,     WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:CS-PS{6A:CXW2}I:DAC-I, OUTPUT=BR:CS-PS{6A:CXW2}I:DAC-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:CS-PS{6A:CXW2}I:DAC-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:CS-PS{6A:CXW2}E:PS-I,  OUTPUT=BR:CS-PS{6A:CXW2}E:PS-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:CS-PS{6A:CXW2}E:PS-I,  WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:CS-PS{6A:CXW2}I-SP, CH_REF=BR:CS-PS{6A:CXW2}I-SP_Ref, CH_TOL=BR:CS-PS{6A:CXW2}I_SP_Tol-SP, CH_ARCH=BR:CS-PS{6A:CXW2}I_SP_Arch-I, CH_DIFFREF=BR:CS-PS{6A:CXW2}I_SP_DiffRef-I, CH_DIFFARCH=BR:CS-PS{6A:CXW2}I_SP_DiffArch-I, CH_FLG=BR:CS-PS{6A:CXW2}I_SP_MonitFlg-Sts, CH_FLGARCH=BR:CS-PS{6A:CXW2}I_SP_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:CS-PS{6A:CXW2}I-SP, CH_REF=BR:CS-PS{6A:CXW2}I-SP_Ref, CH_DIFFREF=BR:CS-PS{6A:CXW2}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:CS-PS{6A:CXW2}I-I, CH_REF=BR:CS-PS{6A:CXW2}I-I_Ref, CH_TOL=BR:CS-PS{6A:CXW2}I_I_Tol-SP, CH_ARCH=BR:CS-PS{6A:CXW2}I_I_Arch-I, CH_DIFFREF=BR:CS-PS{6A:CXW2}I_I_DiffRef-I, CH_DIFFARCH=BR:CS-PS{6A:CXW2}I_I_DiffArch-I, CH_FLG=BR:CS-PS{6A:CXW2}I_I_MonitFlg-Sts, CH_FLGARCH=BR:CS-PS{6A:CXW2}I_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:CS-PS{6A:CXW2}I-I, CH_REF=BR:CS-PS{6A:CXW2}I-I_Ref, CH_DIFFREF=BR:CS-PS{6A:CXW2}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:CS-PS{6A:CXW2}I-I, CH_REF=BR:CS-PS{6A:CXW2}I-SP-1k, CH_DIFFREF=BR:CS-PS{6A:CXW2}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:CS-PS{6A:CXW2}I:DAC-I, CH_REF=BR:CS-PS{6A:CXW2}I:DAC-I_Ref, CH_TOL=BR:CS-PS{6A:CXW2}I:DAC_I_Tol-SP,  CH_ARCH=BR:CS-PS{6A:CXW2}I:DAC_I_Arch-I, CH_DIFFREF=BR:CS-PS{6A:CXW2}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR:CS-PS{6A:CXW2}I:DAC_I_DiffArch-I, CH_FLG=BR:CS-PS{6A:CXW2}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:CS-PS{6A:CXW2}I:DAC_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:CS-PS{6A:CXW2}I:DAC-I, CH_REF=BR:CS-PS{6A:CXW2}I:DAC-I_Ref, CH_DIFFREF=BR:CS-PS{6A:CXW2}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:CS-PS{6A:CXW2}I:DAC-I, CH_REF=BR:CS-PS{6A:CXW2}I-SP-1k, CH_DIFFREF=BR:CS-PS{6A:CXW2}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:CS-PS{6A:CXW2}E:PS-I, CH_REF=BR:CS-PS{6A:CXW2}E:PS-I_Ref, CH_TOL=BR:CS-PS{6A:CXW2}E:PS_I_Tol-SP, CH_ARCH=BR:CS-PS{6A:CXW2}E:PS_I_Arch-I, CH_DIFFREF=BR:CS-PS{6A:CXW2}E:PS_I_DiffRef-I, CH_DIFFARCH=BR:CS-PS{6A:CXW2}E:PS_I_DiffArch-I, CH_FLG=BR:CS-PS{6A:CXW2}E:PS_I_MonitFlg-Sts, CH_FLGARCH=BR:CS-PS{6A:CXW2}E:PS_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:CS-PS{6A:CXW2}E:PS-I, CH_REF=BR:CS-PS{6A:CXW2}E:PS-I_Ref, CH_DIFFREF=BR:CS-PS{6A:CXW2}E:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:CS-PS{6A:CXW2}Cmd:PwrOn-Cmd, CH_REF=BR:CS-PS{6A:CXW2}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:CS-PS{6A:CXW2}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:CS-PS{6A:CXW2}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:CS-PS{6A:CXW2}Cmd:PwrOn_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:CS-PS{6A:CXW2}Cmd:PwrOn-Cmd, CH_REF=BR:CS-PS{6A:CXW2}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:CS-PS{6A:CXW2}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:CS-PS{6A:CXW2}Sts:PSworks-Sts, CH_REF=BR:CS-PS{6A:CXW2}Sts:PSworks-Sts_Ref, CH_ARCH=BR:CS-PS{6A:CXW2}Sts:PSworks_Arch-Sts, CH_FLG=BR:CS-PS{6A:CXW2}Sts:PSworks_MonitFlg-Sts, CH_FLGARCH=BR:CS-PS{6A:CXW2}Sts:PSworks_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:CS-PS{6A:CXW2}Sts:PSworks-Sts, CH_REF=BR:CS-PS{6A:CXW2}Sts:PSworks-Sts_Ref, CH_FLG=BR:CS-PS{6A:CXW2}Sts:PSworks_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")


# PSC31 Chan 1
# BR:A3-PS{6A:CX1} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:A3-PS{6A:CX1}I-SP,              OUTPUT=BR{PSC31}DAC:1-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC31}ADC:08-I,    OUTPUT=BR:A3-PS{6A:CX1}I-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC31}ADC:09-I,    OUTPUT=BR:A3-PS{6A:CX1}I:DAC-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC31}ADC:10-I,    OUTPUT=BR:A3-PS{6A:CX1}E:PS-I,      WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:A3-PS{6A:CX1}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC31}DO:0-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC31}DI:00-Sts,   OUTPUT=BR:A3-PS{6A:CX1}Sts:PSworks-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:A3-PS{6A:CX1}I-SP, OUTPUT=BR:A3-PS{6A:CX1}I-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:A3-PS{6A:CX1}I-SP-1k, OUTPUT=BR:A3-PS{6A:CX1}I-SP-1k-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A3-PS{6A:CX1}I-SP-1k, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A3-PS{6A:CX1}I-I,     OUTPUT=BR:A3-PS{6A:CX1}I-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A3-PS{6A:CX1}I-I,     WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A3-PS{6A:CX1}I:DAC-I, OUTPUT=BR:A3-PS{6A:CX1}I:DAC-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A3-PS{6A:CX1}I:DAC-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A3-PS{6A:CX1}E:PS-I,  OUTPUT=BR:A3-PS{6A:CX1}E:PS-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A3-PS{6A:CX1}E:PS-I,  WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A3-PS{6A:CX1}I-SP, CH_REF=BR:A3-PS{6A:CX1}I-SP_Ref, CH_TOL=BR:A3-PS{6A:CX1}I_SP_Tol-SP, CH_ARCH=BR:A3-PS{6A:CX1}I_SP_Arch-I, CH_DIFFREF=BR:A3-PS{6A:CX1}I_SP_DiffRef-I, CH_DIFFARCH=BR:A3-PS{6A:CX1}I_SP_DiffArch-I, CH_FLG=BR:A3-PS{6A:CX1}I_SP_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:CX1}I_SP_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:CX1}I-SP, CH_REF=BR:A3-PS{6A:CX1}I-SP_Ref, CH_DIFFREF=BR:A3-PS{6A:CX1}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A3-PS{6A:CX1}I-I, CH_REF=BR:A3-PS{6A:CX1}I-I_Ref, CH_TOL=BR:A3-PS{6A:CX1}I_I_Tol-SP, CH_ARCH=BR:A3-PS{6A:CX1}I_I_Arch-I, CH_DIFFREF=BR:A3-PS{6A:CX1}I_I_DiffRef-I, CH_DIFFARCH=BR:A3-PS{6A:CX1}I_I_DiffArch-I, CH_FLG=BR:A3-PS{6A:CX1}I_I_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:CX1}I_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:CX1}I-I, CH_REF=BR:A3-PS{6A:CX1}I-I_Ref, CH_DIFFREF=BR:A3-PS{6A:CX1}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:CX1}I-I, CH_REF=BR:A3-PS{6A:CX1}I-SP-1k, CH_DIFFREF=BR:A3-PS{6A:CX1}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A3-PS{6A:CX1}I:DAC-I, CH_REF=BR:A3-PS{6A:CX1}I:DAC-I_Ref, CH_TOL=BR:A3-PS{6A:CX1}I:DAC_I_Tol-SP,  CH_ARCH=BR:A3-PS{6A:CX1}I:DAC_I_Arch-I, CH_DIFFREF=BR:A3-PS{6A:CX1}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR:A3-PS{6A:CX1}I:DAC_I_DiffArch-I, CH_FLG=BR:A3-PS{6A:CX1}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:CX1}I:DAC_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:CX1}I:DAC-I, CH_REF=BR:A3-PS{6A:CX1}I:DAC-I_Ref, CH_DIFFREF=BR:A3-PS{6A:CX1}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:CX1}I:DAC-I, CH_REF=BR:A3-PS{6A:CX1}I-SP-1k, CH_DIFFREF=BR:A3-PS{6A:CX1}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A3-PS{6A:CX1}E:PS-I, CH_REF=BR:A3-PS{6A:CX1}E:PS-I_Ref, CH_TOL=BR:A3-PS{6A:CX1}E:PS_I_Tol-SP, CH_ARCH=BR:A3-PS{6A:CX1}E:PS_I_Arch-I, CH_DIFFREF=BR:A3-PS{6A:CX1}E:PS_I_DiffRef-I, CH_DIFFARCH=BR:A3-PS{6A:CX1}E:PS_I_DiffArch-I, CH_FLG=BR:A3-PS{6A:CX1}E:PS_I_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:CX1}E:PS_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:CX1}E:PS-I, CH_REF=BR:A3-PS{6A:CX1}E:PS-I_Ref, CH_DIFFREF=BR:A3-PS{6A:CX1}E:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A3-PS{6A:CX1}Cmd:PwrOn-Cmd, CH_REF=BR:A3-PS{6A:CX1}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:A3-PS{6A:CX1}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:A3-PS{6A:CX1}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:CX1}Cmd:PwrOn_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A3-PS{6A:CX1}Cmd:PwrOn-Cmd, CH_REF=BR:A3-PS{6A:CX1}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:A3-PS{6A:CX1}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A3-PS{6A:CX1}Sts:PSworks-Sts, CH_REF=BR:A3-PS{6A:CX1}Sts:PSworks-Sts_Ref, CH_ARCH=BR:A3-PS{6A:CX1}Sts:PSworks_Arch-Sts, CH_FLG=BR:A3-PS{6A:CX1}Sts:PSworks_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:CX1}Sts:PSworks_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A3-PS{6A:CX1}Sts:PSworks-Sts, CH_REF=BR:A3-PS{6A:CX1}Sts:PSworks-Sts_Ref, CH_FLG=BR:A3-PS{6A:CX1}Sts:PSworks_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")


# PSC32 Chan 0
# BR:A3-PS{6A:CX2} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:A3-PS{6A:CX2}I-SP,              OUTPUT=BR{PSC32}DAC:0-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC32}ADC:00-I,    OUTPUT=BR:A3-PS{6A:CX2}I-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC32}ADC:01-I,    OUTPUT=BR:A3-PS{6A:CX2}I:DAC-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC32}ADC:02-I,    OUTPUT=BR:A3-PS{6A:CX2}E:PS-I,      WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:A3-PS{6A:CX2}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC32}DO:1-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC32}DI:01-Sts,   OUTPUT=BR:A3-PS{6A:CX2}Sts:PSworks-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:A3-PS{6A:CX2}I-SP, OUTPUT=BR:A3-PS{6A:CX2}I-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:A3-PS{6A:CX2}I-SP-1k, OUTPUT=BR:A3-PS{6A:CX2}I-SP-1k-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A3-PS{6A:CX2}I-SP-1k, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A3-PS{6A:CX2}I-I,     OUTPUT=BR:A3-PS{6A:CX2}I-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A3-PS{6A:CX2}I-I,     WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A3-PS{6A:CX2}I:DAC-I, OUTPUT=BR:A3-PS{6A:CX2}I:DAC-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A3-PS{6A:CX2}I:DAC-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A3-PS{6A:CX2}E:PS-I,  OUTPUT=BR:A3-PS{6A:CX2}E:PS-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A3-PS{6A:CX2}E:PS-I,  WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A3-PS{6A:CX2}I-SP, CH_REF=BR:A3-PS{6A:CX2}I-SP_Ref, CH_TOL=BR:A3-PS{6A:CX2}I_SP_Tol-SP, CH_ARCH=BR:A3-PS{6A:CX2}I_SP_Arch-I, CH_DIFFREF=BR:A3-PS{6A:CX2}I_SP_DiffRef-I, CH_DIFFARCH=BR:A3-PS{6A:CX2}I_SP_DiffArch-I, CH_FLG=BR:A3-PS{6A:CX2}I_SP_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:CX2}I_SP_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:CX2}I-SP, CH_REF=BR:A3-PS{6A:CX2}I-SP_Ref, CH_DIFFREF=BR:A3-PS{6A:CX2}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A3-PS{6A:CX2}I-I, CH_REF=BR:A3-PS{6A:CX2}I-I_Ref, CH_TOL=BR:A3-PS{6A:CX2}I_I_Tol-SP, CH_ARCH=BR:A3-PS{6A:CX2}I_I_Arch-I, CH_DIFFREF=BR:A3-PS{6A:CX2}I_I_DiffRef-I, CH_DIFFARCH=BR:A3-PS{6A:CX2}I_I_DiffArch-I, CH_FLG=BR:A3-PS{6A:CX2}I_I_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:CX2}I_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:CX2}I-I, CH_REF=BR:A3-PS{6A:CX2}I-I_Ref, CH_DIFFREF=BR:A3-PS{6A:CX2}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:CX2}I-I, CH_REF=BR:A3-PS{6A:CX2}I-SP-1k, CH_DIFFREF=BR:A3-PS{6A:CX2}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A3-PS{6A:CX2}I:DAC-I, CH_REF=BR:A3-PS{6A:CX2}I:DAC-I_Ref, CH_TOL=BR:A3-PS{6A:CX2}I:DAC_I_Tol-SP,  CH_ARCH=BR:A3-PS{6A:CX2}I:DAC_I_Arch-I, CH_DIFFREF=BR:A3-PS{6A:CX2}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR:A3-PS{6A:CX2}I:DAC_I_DiffArch-I, CH_FLG=BR:A3-PS{6A:CX2}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:CX2}I:DAC_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:CX2}I:DAC-I, CH_REF=BR:A3-PS{6A:CX2}I:DAC-I_Ref, CH_DIFFREF=BR:A3-PS{6A:CX2}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:CX2}I:DAC-I, CH_REF=BR:A3-PS{6A:CX2}I-SP-1k, CH_DIFFREF=BR:A3-PS{6A:CX2}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A3-PS{6A:CX2}E:PS-I, CH_REF=BR:A3-PS{6A:CX2}E:PS-I_Ref, CH_TOL=BR:A3-PS{6A:CX2}E:PS_I_Tol-SP, CH_ARCH=BR:A3-PS{6A:CX2}E:PS_I_Arch-I, CH_DIFFREF=BR:A3-PS{6A:CX2}E:PS_I_DiffRef-I, CH_DIFFARCH=BR:A3-PS{6A:CX2}E:PS_I_DiffArch-I, CH_FLG=BR:A3-PS{6A:CX2}E:PS_I_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:CX2}E:PS_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:CX2}E:PS-I, CH_REF=BR:A3-PS{6A:CX2}E:PS-I_Ref, CH_DIFFREF=BR:A3-PS{6A:CX2}E:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A3-PS{6A:CX2}Cmd:PwrOn-Cmd, CH_REF=BR:A3-PS{6A:CX2}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:A3-PS{6A:CX2}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:A3-PS{6A:CX2}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:CX2}Cmd:PwrOn_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A3-PS{6A:CX2}Cmd:PwrOn-Cmd, CH_REF=BR:A3-PS{6A:CX2}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:A3-PS{6A:CX2}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A3-PS{6A:CX2}Sts:PSworks-Sts, CH_REF=BR:A3-PS{6A:CX2}Sts:PSworks-Sts_Ref, CH_ARCH=BR:A3-PS{6A:CX2}Sts:PSworks_Arch-Sts, CH_FLG=BR:A3-PS{6A:CX2}Sts:PSworks_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:CX2}Sts:PSworks_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A3-PS{6A:CX2}Sts:PSworks-Sts, CH_REF=BR:A3-PS{6A:CX2}Sts:PSworks-Sts_Ref, CH_FLG=BR:A3-PS{6A:CX2}Sts:PSworks_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")


# PSC32 Chan 1
# BR:A3-PS{6A:CX3} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:A3-PS{6A:CX3}I-SP,              OUTPUT=BR{PSC32}DAC:1-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC32}ADC:08-I,    OUTPUT=BR:A3-PS{6A:CX3}I-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC32}ADC:09-I,    OUTPUT=BR:A3-PS{6A:CX3}I:DAC-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC32}ADC:10-I,    OUTPUT=BR:A3-PS{6A:CX3}E:PS-I,      WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:A3-PS{6A:CX3}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC32}DO:0-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC32}DI:00-Sts,   OUTPUT=BR:A3-PS{6A:CX3}Sts:PSworks-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:A3-PS{6A:CX3}I-SP, OUTPUT=BR:A3-PS{6A:CX3}I-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:A3-PS{6A:CX3}I-SP-1k, OUTPUT=BR:A3-PS{6A:CX3}I-SP-1k-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A3-PS{6A:CX3}I-SP-1k, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A3-PS{6A:CX3}I-I,     OUTPUT=BR:A3-PS{6A:CX3}I-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A3-PS{6A:CX3}I-I,     WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A3-PS{6A:CX3}I:DAC-I, OUTPUT=BR:A3-PS{6A:CX3}I:DAC-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A3-PS{6A:CX3}I:DAC-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A3-PS{6A:CX3}E:PS-I,  OUTPUT=BR:A3-PS{6A:CX3}E:PS-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A3-PS{6A:CX3}E:PS-I,  WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A3-PS{6A:CX3}I-SP, CH_REF=BR:A3-PS{6A:CX3}I-SP_Ref, CH_TOL=BR:A3-PS{6A:CX3}I_SP_Tol-SP, CH_ARCH=BR:A3-PS{6A:CX3}I_SP_Arch-I, CH_DIFFREF=BR:A3-PS{6A:CX3}I_SP_DiffRef-I, CH_DIFFARCH=BR:A3-PS{6A:CX3}I_SP_DiffArch-I, CH_FLG=BR:A3-PS{6A:CX3}I_SP_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:CX3}I_SP_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:CX3}I-SP, CH_REF=BR:A3-PS{6A:CX3}I-SP_Ref, CH_DIFFREF=BR:A3-PS{6A:CX3}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A3-PS{6A:CX3}I-I, CH_REF=BR:A3-PS{6A:CX3}I-I_Ref, CH_TOL=BR:A3-PS{6A:CX3}I_I_Tol-SP, CH_ARCH=BR:A3-PS{6A:CX3}I_I_Arch-I, CH_DIFFREF=BR:A3-PS{6A:CX3}I_I_DiffRef-I, CH_DIFFARCH=BR:A3-PS{6A:CX3}I_I_DiffArch-I, CH_FLG=BR:A3-PS{6A:CX3}I_I_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:CX3}I_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:CX3}I-I, CH_REF=BR:A3-PS{6A:CX3}I-I_Ref, CH_DIFFREF=BR:A3-PS{6A:CX3}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:CX3}I-I, CH_REF=BR:A3-PS{6A:CX3}I-SP-1k, CH_DIFFREF=BR:A3-PS{6A:CX3}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A3-PS{6A:CX3}I:DAC-I, CH_REF=BR:A3-PS{6A:CX3}I:DAC-I_Ref, CH_TOL=BR:A3-PS{6A:CX3}I:DAC_I_Tol-SP,  CH_ARCH=BR:A3-PS{6A:CX3}I:DAC_I_Arch-I, CH_DIFFREF=BR:A3-PS{6A:CX3}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR:A3-PS{6A:CX3}I:DAC_I_DiffArch-I, CH_FLG=BR:A3-PS{6A:CX3}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:CX3}I:DAC_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:CX3}I:DAC-I, CH_REF=BR:A3-PS{6A:CX3}I:DAC-I_Ref, CH_DIFFREF=BR:A3-PS{6A:CX3}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:CX3}I:DAC-I, CH_REF=BR:A3-PS{6A:CX3}I-SP-1k, CH_DIFFREF=BR:A3-PS{6A:CX3}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A3-PS{6A:CX3}E:PS-I, CH_REF=BR:A3-PS{6A:CX3}E:PS-I_Ref, CH_TOL=BR:A3-PS{6A:CX3}E:PS_I_Tol-SP, CH_ARCH=BR:A3-PS{6A:CX3}E:PS_I_Arch-I, CH_DIFFREF=BR:A3-PS{6A:CX3}E:PS_I_DiffRef-I, CH_DIFFARCH=BR:A3-PS{6A:CX3}E:PS_I_DiffArch-I, CH_FLG=BR:A3-PS{6A:CX3}E:PS_I_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:CX3}E:PS_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:CX3}E:PS-I, CH_REF=BR:A3-PS{6A:CX3}E:PS-I_Ref, CH_DIFFREF=BR:A3-PS{6A:CX3}E:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A3-PS{6A:CX3}Cmd:PwrOn-Cmd, CH_REF=BR:A3-PS{6A:CX3}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:A3-PS{6A:CX3}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:A3-PS{6A:CX3}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:CX3}Cmd:PwrOn_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A3-PS{6A:CX3}Cmd:PwrOn-Cmd, CH_REF=BR:A3-PS{6A:CX3}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:A3-PS{6A:CX3}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A3-PS{6A:CX3}Sts:PSworks-Sts, CH_REF=BR:A3-PS{6A:CX3}Sts:PSworks-Sts_Ref, CH_ARCH=BR:A3-PS{6A:CX3}Sts:PSworks_Arch-Sts, CH_FLG=BR:A3-PS{6A:CX3}Sts:PSworks_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:CX3}Sts:PSworks_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A3-PS{6A:CX3}Sts:PSworks-Sts, CH_REF=BR:A3-PS{6A:CX3}Sts:PSworks-Sts_Ref, CH_FLG=BR:A3-PS{6A:CX3}Sts:PSworks_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")


# PSC33 Chan 0
# BR:CS-PS{6A:CXW1} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:CS-PS{6A:CXW1}I-SP,              OUTPUT=BR{PSC33}DAC:0-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC33}ADC:00-I,    OUTPUT=BR:CS-PS{6A:CXW1}I-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC33}ADC:01-I,    OUTPUT=BR:CS-PS{6A:CXW1}I:DAC-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC33}ADC:02-I,    OUTPUT=BR:CS-PS{6A:CXW1}E:PS-I,      WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:CS-PS{6A:CXW1}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC33}DO:1-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC33}DI:01-Sts,   OUTPUT=BR:CS-PS{6A:CXW1}Sts:PSworks-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:CS-PS{6A:CXW1}I-SP, OUTPUT=BR:CS-PS{6A:CXW1}I-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:CS-PS{6A:CXW1}I-SP-1k, OUTPUT=BR:CS-PS{6A:CXW1}I-SP-1k-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:CS-PS{6A:CXW1}I-SP-1k, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:CS-PS{6A:CXW1}I-I,     OUTPUT=BR:CS-PS{6A:CXW1}I-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:CS-PS{6A:CXW1}I-I,     WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:CS-PS{6A:CXW1}I:DAC-I, OUTPUT=BR:CS-PS{6A:CXW1}I:DAC-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:CS-PS{6A:CXW1}I:DAC-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:CS-PS{6A:CXW1}E:PS-I,  OUTPUT=BR:CS-PS{6A:CXW1}E:PS-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:CS-PS{6A:CXW1}E:PS-I,  WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:CS-PS{6A:CXW1}I-SP, CH_REF=BR:CS-PS{6A:CXW1}I-SP_Ref, CH_TOL=BR:CS-PS{6A:CXW1}I_SP_Tol-SP, CH_ARCH=BR:CS-PS{6A:CXW1}I_SP_Arch-I, CH_DIFFREF=BR:CS-PS{6A:CXW1}I_SP_DiffRef-I, CH_DIFFARCH=BR:CS-PS{6A:CXW1}I_SP_DiffArch-I, CH_FLG=BR:CS-PS{6A:CXW1}I_SP_MonitFlg-Sts, CH_FLGARCH=BR:CS-PS{6A:CXW1}I_SP_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:CS-PS{6A:CXW1}I-SP, CH_REF=BR:CS-PS{6A:CXW1}I-SP_Ref, CH_DIFFREF=BR:CS-PS{6A:CXW1}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:CS-PS{6A:CXW1}I-I, CH_REF=BR:CS-PS{6A:CXW1}I-I_Ref, CH_TOL=BR:CS-PS{6A:CXW1}I_I_Tol-SP, CH_ARCH=BR:CS-PS{6A:CXW1}I_I_Arch-I, CH_DIFFREF=BR:CS-PS{6A:CXW1}I_I_DiffRef-I, CH_DIFFARCH=BR:CS-PS{6A:CXW1}I_I_DiffArch-I, CH_FLG=BR:CS-PS{6A:CXW1}I_I_MonitFlg-Sts, CH_FLGARCH=BR:CS-PS{6A:CXW1}I_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:CS-PS{6A:CXW1}I-I, CH_REF=BR:CS-PS{6A:CXW1}I-I_Ref, CH_DIFFREF=BR:CS-PS{6A:CXW1}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:CS-PS{6A:CXW1}I-I, CH_REF=BR:CS-PS{6A:CXW1}I-SP-1k, CH_DIFFREF=BR:CS-PS{6A:CXW1}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:CS-PS{6A:CXW1}I:DAC-I, CH_REF=BR:CS-PS{6A:CXW1}I:DAC-I_Ref, CH_TOL=BR:CS-PS{6A:CXW1}I:DAC_I_Tol-SP,  CH_ARCH=BR:CS-PS{6A:CXW1}I:DAC_I_Arch-I, CH_DIFFREF=BR:CS-PS{6A:CXW1}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR:CS-PS{6A:CXW1}I:DAC_I_DiffArch-I, CH_FLG=BR:CS-PS{6A:CXW1}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:CS-PS{6A:CXW1}I:DAC_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:CS-PS{6A:CXW1}I:DAC-I, CH_REF=BR:CS-PS{6A:CXW1}I:DAC-I_Ref, CH_DIFFREF=BR:CS-PS{6A:CXW1}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:CS-PS{6A:CXW1}I:DAC-I, CH_REF=BR:CS-PS{6A:CXW1}I-SP-1k, CH_DIFFREF=BR:CS-PS{6A:CXW1}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:CS-PS{6A:CXW1}E:PS-I, CH_REF=BR:CS-PS{6A:CXW1}E:PS-I_Ref, CH_TOL=BR:CS-PS{6A:CXW1}E:PS_I_Tol-SP, CH_ARCH=BR:CS-PS{6A:CXW1}E:PS_I_Arch-I, CH_DIFFREF=BR:CS-PS{6A:CXW1}E:PS_I_DiffRef-I, CH_DIFFARCH=BR:CS-PS{6A:CXW1}E:PS_I_DiffArch-I, CH_FLG=BR:CS-PS{6A:CXW1}E:PS_I_MonitFlg-Sts, CH_FLGARCH=BR:CS-PS{6A:CXW1}E:PS_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:CS-PS{6A:CXW1}E:PS-I, CH_REF=BR:CS-PS{6A:CXW1}E:PS-I_Ref, CH_DIFFREF=BR:CS-PS{6A:CXW1}E:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:CS-PS{6A:CXW1}Cmd:PwrOn-Cmd, CH_REF=BR:CS-PS{6A:CXW1}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:CS-PS{6A:CXW1}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:CS-PS{6A:CXW1}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:CS-PS{6A:CXW1}Cmd:PwrOn_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:CS-PS{6A:CXW1}Cmd:PwrOn-Cmd, CH_REF=BR:CS-PS{6A:CXW1}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:CS-PS{6A:CXW1}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:CS-PS{6A:CXW1}Sts:PSworks-Sts, CH_REF=BR:CS-PS{6A:CXW1}Sts:PSworks-Sts_Ref, CH_ARCH=BR:CS-PS{6A:CXW1}Sts:PSworks_Arch-Sts, CH_FLG=BR:CS-PS{6A:CXW1}Sts:PSworks_MonitFlg-Sts, CH_FLGARCH=BR:CS-PS{6A:CXW1}Sts:PSworks_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:CS-PS{6A:CXW1}Sts:PSworks-Sts, CH_REF=BR:CS-PS{6A:CXW1}Sts:PSworks-Sts_Ref, CH_FLG=BR:CS-PS{6A:CXW1}Sts:PSworks_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")


# PSC33 Chan 1
# BR:A3-PS{6A:SF1} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:A3-PS{6A:SF1}I-SP,              OUTPUT=BR{PSC33}DAC:1-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC33}ADC:08-I,    OUTPUT=BR:A3-PS{6A:SF1}I-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC33}ADC:09-I,    OUTPUT=BR:A3-PS{6A:SF1}I:DAC-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC33}ADC:10-I,    OUTPUT=BR:A3-PS{6A:SF1}E:PS-I,      WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:A3-PS{6A:SF1}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC33}DO:0-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC33}DI:00-Sts,   OUTPUT=BR:A3-PS{6A:SF1}Sts:PSworks-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:A3-PS{6A:SF1}I-SP, OUTPUT=BR:A3-PS{6A:SF1}I-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:A3-PS{6A:SF1}I-SP-1k, OUTPUT=BR:A3-PS{6A:SF1}I-SP-1k-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A3-PS{6A:SF1}I-SP-1k, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A3-PS{6A:SF1}I-I,     OUTPUT=BR:A3-PS{6A:SF1}I-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A3-PS{6A:SF1}I-I,     WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A3-PS{6A:SF1}I:DAC-I, OUTPUT=BR:A3-PS{6A:SF1}I:DAC-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A3-PS{6A:SF1}I:DAC-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A3-PS{6A:SF1}E:PS-I,  OUTPUT=BR:A3-PS{6A:SF1}E:PS-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A3-PS{6A:SF1}E:PS-I,  WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A3-PS{6A:SF1}I-SP, CH_REF=BR:A3-PS{6A:SF1}I-SP_Ref, CH_TOL=BR:A3-PS{6A:SF1}I_SP_Tol-SP, CH_ARCH=BR:A3-PS{6A:SF1}I_SP_Arch-I, CH_DIFFREF=BR:A3-PS{6A:SF1}I_SP_DiffRef-I, CH_DIFFARCH=BR:A3-PS{6A:SF1}I_SP_DiffArch-I, CH_FLG=BR:A3-PS{6A:SF1}I_SP_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:SF1}I_SP_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:SF1}I-SP, CH_REF=BR:A3-PS{6A:SF1}I-SP_Ref, CH_DIFFREF=BR:A3-PS{6A:SF1}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A3-PS{6A:SF1}I-I, CH_REF=BR:A3-PS{6A:SF1}I-I_Ref, CH_TOL=BR:A3-PS{6A:SF1}I_I_Tol-SP, CH_ARCH=BR:A3-PS{6A:SF1}I_I_Arch-I, CH_DIFFREF=BR:A3-PS{6A:SF1}I_I_DiffRef-I, CH_DIFFARCH=BR:A3-PS{6A:SF1}I_I_DiffArch-I, CH_FLG=BR:A3-PS{6A:SF1}I_I_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:SF1}I_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:SF1}I-I, CH_REF=BR:A3-PS{6A:SF1}I-I_Ref, CH_DIFFREF=BR:A3-PS{6A:SF1}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:SF1}I-I, CH_REF=BR:A3-PS{6A:SF1}I-SP-1k, CH_DIFFREF=BR:A3-PS{6A:SF1}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A3-PS{6A:SF1}I:DAC-I, CH_REF=BR:A3-PS{6A:SF1}I:DAC-I_Ref, CH_TOL=BR:A3-PS{6A:SF1}I:DAC_I_Tol-SP,  CH_ARCH=BR:A3-PS{6A:SF1}I:DAC_I_Arch-I, CH_DIFFREF=BR:A3-PS{6A:SF1}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR:A3-PS{6A:SF1}I:DAC_I_DiffArch-I, CH_FLG=BR:A3-PS{6A:SF1}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:SF1}I:DAC_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:SF1}I:DAC-I, CH_REF=BR:A3-PS{6A:SF1}I:DAC-I_Ref, CH_DIFFREF=BR:A3-PS{6A:SF1}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:SF1}I:DAC-I, CH_REF=BR:A3-PS{6A:SF1}I-SP-1k, CH_DIFFREF=BR:A3-PS{6A:SF1}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A3-PS{6A:SF1}E:PS-I, CH_REF=BR:A3-PS{6A:SF1}E:PS-I_Ref, CH_TOL=BR:A3-PS{6A:SF1}E:PS_I_Tol-SP, CH_ARCH=BR:A3-PS{6A:SF1}E:PS_I_Arch-I, CH_DIFFREF=BR:A3-PS{6A:SF1}E:PS_I_DiffRef-I, CH_DIFFARCH=BR:A3-PS{6A:SF1}E:PS_I_DiffArch-I, CH_FLG=BR:A3-PS{6A:SF1}E:PS_I_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:SF1}E:PS_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:SF1}E:PS-I, CH_REF=BR:A3-PS{6A:SF1}E:PS-I_Ref, CH_DIFFREF=BR:A3-PS{6A:SF1}E:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A3-PS{6A:SF1}Cmd:PwrOn-Cmd, CH_REF=BR:A3-PS{6A:SF1}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:A3-PS{6A:SF1}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:A3-PS{6A:SF1}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:SF1}Cmd:PwrOn_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A3-PS{6A:SF1}Cmd:PwrOn-Cmd, CH_REF=BR:A3-PS{6A:SF1}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:A3-PS{6A:SF1}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A3-PS{6A:SF1}Sts:PSworks-Sts, CH_REF=BR:A3-PS{6A:SF1}Sts:PSworks-Sts_Ref, CH_ARCH=BR:A3-PS{6A:SF1}Sts:PSworks_Arch-Sts, CH_FLG=BR:A3-PS{6A:SF1}Sts:PSworks_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:SF1}Sts:PSworks_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A3-PS{6A:SF1}Sts:PSworks-Sts, CH_REF=BR:A3-PS{6A:SF1}Sts:PSworks-Sts_Ref, CH_FLG=BR:A3-PS{6A:SF1}Sts:PSworks_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")


# PSC34 Chan 0
# BR:A3-PS{6A:CY1} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:A3-PS{6A:CY1}I-SP,              OUTPUT=BR{PSC34}DAC:0-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC34}ADC:00-I,    OUTPUT=BR:A3-PS{6A:CY1}I-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC34}ADC:01-I,    OUTPUT=BR:A3-PS{6A:CY1}I:DAC-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC34}ADC:02-I,    OUTPUT=BR:A3-PS{6A:CY1}E:PS-I,      WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:A3-PS{6A:CY1}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC34}DO:1-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC34}DI:01-Sts,   OUTPUT=BR:A3-PS{6A:CY1}Sts:PSworks-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:A3-PS{6A:CY1}I-SP, OUTPUT=BR:A3-PS{6A:CY1}I-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:A3-PS{6A:CY1}I-SP-1k, OUTPUT=BR:A3-PS{6A:CY1}I-SP-1k-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A3-PS{6A:CY1}I-SP-1k, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A3-PS{6A:CY1}I-I,     OUTPUT=BR:A3-PS{6A:CY1}I-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A3-PS{6A:CY1}I-I,     WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A3-PS{6A:CY1}I:DAC-I, OUTPUT=BR:A3-PS{6A:CY1}I:DAC-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A3-PS{6A:CY1}I:DAC-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A3-PS{6A:CY1}E:PS-I,  OUTPUT=BR:A3-PS{6A:CY1}E:PS-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A3-PS{6A:CY1}E:PS-I,  WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A3-PS{6A:CY1}I-SP, CH_REF=BR:A3-PS{6A:CY1}I-SP_Ref, CH_TOL=BR:A3-PS{6A:CY1}I_SP_Tol-SP, CH_ARCH=BR:A3-PS{6A:CY1}I_SP_Arch-I, CH_DIFFREF=BR:A3-PS{6A:CY1}I_SP_DiffRef-I, CH_DIFFARCH=BR:A3-PS{6A:CY1}I_SP_DiffArch-I, CH_FLG=BR:A3-PS{6A:CY1}I_SP_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:CY1}I_SP_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:CY1}I-SP, CH_REF=BR:A3-PS{6A:CY1}I-SP_Ref, CH_DIFFREF=BR:A3-PS{6A:CY1}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A3-PS{6A:CY1}I-I, CH_REF=BR:A3-PS{6A:CY1}I-I_Ref, CH_TOL=BR:A3-PS{6A:CY1}I_I_Tol-SP, CH_ARCH=BR:A3-PS{6A:CY1}I_I_Arch-I, CH_DIFFREF=BR:A3-PS{6A:CY1}I_I_DiffRef-I, CH_DIFFARCH=BR:A3-PS{6A:CY1}I_I_DiffArch-I, CH_FLG=BR:A3-PS{6A:CY1}I_I_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:CY1}I_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:CY1}I-I, CH_REF=BR:A3-PS{6A:CY1}I-I_Ref, CH_DIFFREF=BR:A3-PS{6A:CY1}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:CY1}I-I, CH_REF=BR:A3-PS{6A:CY1}I-SP-1k, CH_DIFFREF=BR:A3-PS{6A:CY1}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A3-PS{6A:CY1}I:DAC-I, CH_REF=BR:A3-PS{6A:CY1}I:DAC-I_Ref, CH_TOL=BR:A3-PS{6A:CY1}I:DAC_I_Tol-SP,  CH_ARCH=BR:A3-PS{6A:CY1}I:DAC_I_Arch-I, CH_DIFFREF=BR:A3-PS{6A:CY1}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR:A3-PS{6A:CY1}I:DAC_I_DiffArch-I, CH_FLG=BR:A3-PS{6A:CY1}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:CY1}I:DAC_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:CY1}I:DAC-I, CH_REF=BR:A3-PS{6A:CY1}I:DAC-I_Ref, CH_DIFFREF=BR:A3-PS{6A:CY1}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:CY1}I:DAC-I, CH_REF=BR:A3-PS{6A:CY1}I-SP-1k, CH_DIFFREF=BR:A3-PS{6A:CY1}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A3-PS{6A:CY1}E:PS-I, CH_REF=BR:A3-PS{6A:CY1}E:PS-I_Ref, CH_TOL=BR:A3-PS{6A:CY1}E:PS_I_Tol-SP, CH_ARCH=BR:A3-PS{6A:CY1}E:PS_I_Arch-I, CH_DIFFREF=BR:A3-PS{6A:CY1}E:PS_I_DiffRef-I, CH_DIFFARCH=BR:A3-PS{6A:CY1}E:PS_I_DiffArch-I, CH_FLG=BR:A3-PS{6A:CY1}E:PS_I_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:CY1}E:PS_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:CY1}E:PS-I, CH_REF=BR:A3-PS{6A:CY1}E:PS-I_Ref, CH_DIFFREF=BR:A3-PS{6A:CY1}E:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A3-PS{6A:CY1}Cmd:PwrOn-Cmd, CH_REF=BR:A3-PS{6A:CY1}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:A3-PS{6A:CY1}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:A3-PS{6A:CY1}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:CY1}Cmd:PwrOn_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A3-PS{6A:CY1}Cmd:PwrOn-Cmd, CH_REF=BR:A3-PS{6A:CY1}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:A3-PS{6A:CY1}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A3-PS{6A:CY1}Sts:PSworks-Sts, CH_REF=BR:A3-PS{6A:CY1}Sts:PSworks-Sts_Ref, CH_ARCH=BR:A3-PS{6A:CY1}Sts:PSworks_Arch-Sts, CH_FLG=BR:A3-PS{6A:CY1}Sts:PSworks_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:CY1}Sts:PSworks_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A3-PS{6A:CY1}Sts:PSworks-Sts, CH_REF=BR:A3-PS{6A:CY1}Sts:PSworks-Sts_Ref, CH_FLG=BR:A3-PS{6A:CY1}Sts:PSworks_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")


# PSC34 Chan 1
# BR:A3-PS{6A:CY2} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:A3-PS{6A:CY2}I-SP,              OUTPUT=BR{PSC34}DAC:1-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC34}ADC:08-I,    OUTPUT=BR:A3-PS{6A:CY2}I-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC34}ADC:09-I,    OUTPUT=BR:A3-PS{6A:CY2}I:DAC-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC34}ADC:10-I,    OUTPUT=BR:A3-PS{6A:CY2}E:PS-I,      WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:A3-PS{6A:CY2}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC34}DO:0-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC34}DI:00-Sts,   OUTPUT=BR:A3-PS{6A:CY2}Sts:PSworks-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:A3-PS{6A:CY2}I-SP, OUTPUT=BR:A3-PS{6A:CY2}I-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:A3-PS{6A:CY2}I-SP-1k, OUTPUT=BR:A3-PS{6A:CY2}I-SP-1k-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A3-PS{6A:CY2}I-SP-1k, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A3-PS{6A:CY2}I-I,     OUTPUT=BR:A3-PS{6A:CY2}I-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A3-PS{6A:CY2}I-I,     WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A3-PS{6A:CY2}I:DAC-I, OUTPUT=BR:A3-PS{6A:CY2}I:DAC-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A3-PS{6A:CY2}I:DAC-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A3-PS{6A:CY2}E:PS-I,  OUTPUT=BR:A3-PS{6A:CY2}E:PS-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A3-PS{6A:CY2}E:PS-I,  WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A3-PS{6A:CY2}I-SP, CH_REF=BR:A3-PS{6A:CY2}I-SP_Ref, CH_TOL=BR:A3-PS{6A:CY2}I_SP_Tol-SP, CH_ARCH=BR:A3-PS{6A:CY2}I_SP_Arch-I, CH_DIFFREF=BR:A3-PS{6A:CY2}I_SP_DiffRef-I, CH_DIFFARCH=BR:A3-PS{6A:CY2}I_SP_DiffArch-I, CH_FLG=BR:A3-PS{6A:CY2}I_SP_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:CY2}I_SP_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:CY2}I-SP, CH_REF=BR:A3-PS{6A:CY2}I-SP_Ref, CH_DIFFREF=BR:A3-PS{6A:CY2}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A3-PS{6A:CY2}I-I, CH_REF=BR:A3-PS{6A:CY2}I-I_Ref, CH_TOL=BR:A3-PS{6A:CY2}I_I_Tol-SP, CH_ARCH=BR:A3-PS{6A:CY2}I_I_Arch-I, CH_DIFFREF=BR:A3-PS{6A:CY2}I_I_DiffRef-I, CH_DIFFARCH=BR:A3-PS{6A:CY2}I_I_DiffArch-I, CH_FLG=BR:A3-PS{6A:CY2}I_I_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:CY2}I_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:CY2}I-I, CH_REF=BR:A3-PS{6A:CY2}I-I_Ref, CH_DIFFREF=BR:A3-PS{6A:CY2}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:CY2}I-I, CH_REF=BR:A3-PS{6A:CY2}I-SP-1k, CH_DIFFREF=BR:A3-PS{6A:CY2}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A3-PS{6A:CY2}I:DAC-I, CH_REF=BR:A3-PS{6A:CY2}I:DAC-I_Ref, CH_TOL=BR:A3-PS{6A:CY2}I:DAC_I_Tol-SP,  CH_ARCH=BR:A3-PS{6A:CY2}I:DAC_I_Arch-I, CH_DIFFREF=BR:A3-PS{6A:CY2}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR:A3-PS{6A:CY2}I:DAC_I_DiffArch-I, CH_FLG=BR:A3-PS{6A:CY2}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:CY2}I:DAC_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:CY2}I:DAC-I, CH_REF=BR:A3-PS{6A:CY2}I:DAC-I_Ref, CH_DIFFREF=BR:A3-PS{6A:CY2}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:CY2}I:DAC-I, CH_REF=BR:A3-PS{6A:CY2}I-SP-1k, CH_DIFFREF=BR:A3-PS{6A:CY2}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A3-PS{6A:CY2}E:PS-I, CH_REF=BR:A3-PS{6A:CY2}E:PS-I_Ref, CH_TOL=BR:A3-PS{6A:CY2}E:PS_I_Tol-SP, CH_ARCH=BR:A3-PS{6A:CY2}E:PS_I_Arch-I, CH_DIFFREF=BR:A3-PS{6A:CY2}E:PS_I_DiffRef-I, CH_DIFFARCH=BR:A3-PS{6A:CY2}E:PS_I_DiffArch-I, CH_FLG=BR:A3-PS{6A:CY2}E:PS_I_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:CY2}E:PS_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:CY2}E:PS-I, CH_REF=BR:A3-PS{6A:CY2}E:PS-I_Ref, CH_DIFFREF=BR:A3-PS{6A:CY2}E:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A3-PS{6A:CY2}Cmd:PwrOn-Cmd, CH_REF=BR:A3-PS{6A:CY2}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:A3-PS{6A:CY2}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:A3-PS{6A:CY2}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:CY2}Cmd:PwrOn_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A3-PS{6A:CY2}Cmd:PwrOn-Cmd, CH_REF=BR:A3-PS{6A:CY2}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:A3-PS{6A:CY2}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A3-PS{6A:CY2}Sts:PSworks-Sts, CH_REF=BR:A3-PS{6A:CY2}Sts:PSworks-Sts_Ref, CH_ARCH=BR:A3-PS{6A:CY2}Sts:PSworks_Arch-Sts, CH_FLG=BR:A3-PS{6A:CY2}Sts:PSworks_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:CY2}Sts:PSworks_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A3-PS{6A:CY2}Sts:PSworks-Sts, CH_REF=BR:A3-PS{6A:CY2}Sts:PSworks-Sts_Ref, CH_FLG=BR:A3-PS{6A:CY2}Sts:PSworks_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")


# PSC35 Chan 0
# BR:A3-PS{6A:CY3} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:A3-PS{6A:CY3}I-SP,              OUTPUT=BR{PSC35}DAC:0-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC35}ADC:00-I,    OUTPUT=BR:A3-PS{6A:CY3}I-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC35}ADC:01-I,    OUTPUT=BR:A3-PS{6A:CY3}I:DAC-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC35}ADC:02-I,    OUTPUT=BR:A3-PS{6A:CY3}E:PS-I,      WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:A3-PS{6A:CY3}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC35}DO:1-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC35}DI:01-Sts,   OUTPUT=BR:A3-PS{6A:CY3}Sts:PSworks-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:A3-PS{6A:CY3}I-SP, OUTPUT=BR:A3-PS{6A:CY3}I-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:A3-PS{6A:CY3}I-SP-1k, OUTPUT=BR:A3-PS{6A:CY3}I-SP-1k-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A3-PS{6A:CY3}I-SP-1k, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A3-PS{6A:CY3}I-I,     OUTPUT=BR:A3-PS{6A:CY3}I-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A3-PS{6A:CY3}I-I,     WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A3-PS{6A:CY3}I:DAC-I, OUTPUT=BR:A3-PS{6A:CY3}I:DAC-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A3-PS{6A:CY3}I:DAC-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A3-PS{6A:CY3}E:PS-I,  OUTPUT=BR:A3-PS{6A:CY3}E:PS-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A3-PS{6A:CY3}E:PS-I,  WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A3-PS{6A:CY3}I-SP, CH_REF=BR:A3-PS{6A:CY3}I-SP_Ref, CH_TOL=BR:A3-PS{6A:CY3}I_SP_Tol-SP, CH_ARCH=BR:A3-PS{6A:CY3}I_SP_Arch-I, CH_DIFFREF=BR:A3-PS{6A:CY3}I_SP_DiffRef-I, CH_DIFFARCH=BR:A3-PS{6A:CY3}I_SP_DiffArch-I, CH_FLG=BR:A3-PS{6A:CY3}I_SP_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:CY3}I_SP_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:CY3}I-SP, CH_REF=BR:A3-PS{6A:CY3}I-SP_Ref, CH_DIFFREF=BR:A3-PS{6A:CY3}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A3-PS{6A:CY3}I-I, CH_REF=BR:A3-PS{6A:CY3}I-I_Ref, CH_TOL=BR:A3-PS{6A:CY3}I_I_Tol-SP, CH_ARCH=BR:A3-PS{6A:CY3}I_I_Arch-I, CH_DIFFREF=BR:A3-PS{6A:CY3}I_I_DiffRef-I, CH_DIFFARCH=BR:A3-PS{6A:CY3}I_I_DiffArch-I, CH_FLG=BR:A3-PS{6A:CY3}I_I_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:CY3}I_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:CY3}I-I, CH_REF=BR:A3-PS{6A:CY3}I-I_Ref, CH_DIFFREF=BR:A3-PS{6A:CY3}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:CY3}I-I, CH_REF=BR:A3-PS{6A:CY3}I-SP-1k, CH_DIFFREF=BR:A3-PS{6A:CY3}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A3-PS{6A:CY3}I:DAC-I, CH_REF=BR:A3-PS{6A:CY3}I:DAC-I_Ref, CH_TOL=BR:A3-PS{6A:CY3}I:DAC_I_Tol-SP,  CH_ARCH=BR:A3-PS{6A:CY3}I:DAC_I_Arch-I, CH_DIFFREF=BR:A3-PS{6A:CY3}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR:A3-PS{6A:CY3}I:DAC_I_DiffArch-I, CH_FLG=BR:A3-PS{6A:CY3}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:CY3}I:DAC_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:CY3}I:DAC-I, CH_REF=BR:A3-PS{6A:CY3}I:DAC-I_Ref, CH_DIFFREF=BR:A3-PS{6A:CY3}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:CY3}I:DAC-I, CH_REF=BR:A3-PS{6A:CY3}I-SP-1k, CH_DIFFREF=BR:A3-PS{6A:CY3}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A3-PS{6A:CY3}E:PS-I, CH_REF=BR:A3-PS{6A:CY3}E:PS-I_Ref, CH_TOL=BR:A3-PS{6A:CY3}E:PS_I_Tol-SP, CH_ARCH=BR:A3-PS{6A:CY3}E:PS_I_Arch-I, CH_DIFFREF=BR:A3-PS{6A:CY3}E:PS_I_DiffRef-I, CH_DIFFARCH=BR:A3-PS{6A:CY3}E:PS_I_DiffArch-I, CH_FLG=BR:A3-PS{6A:CY3}E:PS_I_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:CY3}E:PS_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:CY3}E:PS-I, CH_REF=BR:A3-PS{6A:CY3}E:PS-I_Ref, CH_DIFFREF=BR:A3-PS{6A:CY3}E:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A3-PS{6A:CY3}Cmd:PwrOn-Cmd, CH_REF=BR:A3-PS{6A:CY3}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:A3-PS{6A:CY3}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:A3-PS{6A:CY3}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:CY3}Cmd:PwrOn_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A3-PS{6A:CY3}Cmd:PwrOn-Cmd, CH_REF=BR:A3-PS{6A:CY3}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:A3-PS{6A:CY3}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A3-PS{6A:CY3}Sts:PSworks-Sts, CH_REF=BR:A3-PS{6A:CY3}Sts:PSworks-Sts_Ref, CH_ARCH=BR:A3-PS{6A:CY3}Sts:PSworks_Arch-Sts, CH_FLG=BR:A3-PS{6A:CY3}Sts:PSworks_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:CY3}Sts:PSworks_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A3-PS{6A:CY3}Sts:PSworks-Sts, CH_REF=BR:A3-PS{6A:CY3}Sts:PSworks-Sts_Ref, CH_FLG=BR:A3-PS{6A:CY3}Sts:PSworks_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")


# PSC35 Chan 1
# BR:A3-PS{6A:CY4} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:A3-PS{6A:CY4}I-SP,              OUTPUT=BR{PSC35}DAC:1-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC35}ADC:08-I,    OUTPUT=BR:A3-PS{6A:CY4}I-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC35}ADC:09-I,    OUTPUT=BR:A3-PS{6A:CY4}I:DAC-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC35}ADC:10-I,    OUTPUT=BR:A3-PS{6A:CY4}E:PS-I,      WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:A3-PS{6A:CY4}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC35}DO:0-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC35}DI:00-Sts,   OUTPUT=BR:A3-PS{6A:CY4}Sts:PSworks-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:A3-PS{6A:CY4}I-SP, OUTPUT=BR:A3-PS{6A:CY4}I-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:A3-PS{6A:CY4}I-SP-1k, OUTPUT=BR:A3-PS{6A:CY4}I-SP-1k-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A3-PS{6A:CY4}I-SP-1k, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A3-PS{6A:CY4}I-I,     OUTPUT=BR:A3-PS{6A:CY4}I-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A3-PS{6A:CY4}I-I,     WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A3-PS{6A:CY4}I:DAC-I, OUTPUT=BR:A3-PS{6A:CY4}I:DAC-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A3-PS{6A:CY4}I:DAC-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A3-PS{6A:CY4}E:PS-I,  OUTPUT=BR:A3-PS{6A:CY4}E:PS-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A3-PS{6A:CY4}E:PS-I,  WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A3-PS{6A:CY4}I-SP, CH_REF=BR:A3-PS{6A:CY4}I-SP_Ref, CH_TOL=BR:A3-PS{6A:CY4}I_SP_Tol-SP, CH_ARCH=BR:A3-PS{6A:CY4}I_SP_Arch-I, CH_DIFFREF=BR:A3-PS{6A:CY4}I_SP_DiffRef-I, CH_DIFFARCH=BR:A3-PS{6A:CY4}I_SP_DiffArch-I, CH_FLG=BR:A3-PS{6A:CY4}I_SP_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:CY4}I_SP_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:CY4}I-SP, CH_REF=BR:A3-PS{6A:CY4}I-SP_Ref, CH_DIFFREF=BR:A3-PS{6A:CY4}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A3-PS{6A:CY4}I-I, CH_REF=BR:A3-PS{6A:CY4}I-I_Ref, CH_TOL=BR:A3-PS{6A:CY4}I_I_Tol-SP, CH_ARCH=BR:A3-PS{6A:CY4}I_I_Arch-I, CH_DIFFREF=BR:A3-PS{6A:CY4}I_I_DiffRef-I, CH_DIFFARCH=BR:A3-PS{6A:CY4}I_I_DiffArch-I, CH_FLG=BR:A3-PS{6A:CY4}I_I_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:CY4}I_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:CY4}I-I, CH_REF=BR:A3-PS{6A:CY4}I-I_Ref, CH_DIFFREF=BR:A3-PS{6A:CY4}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:CY4}I-I, CH_REF=BR:A3-PS{6A:CY4}I-SP-1k, CH_DIFFREF=BR:A3-PS{6A:CY4}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A3-PS{6A:CY4}I:DAC-I, CH_REF=BR:A3-PS{6A:CY4}I:DAC-I_Ref, CH_TOL=BR:A3-PS{6A:CY4}I:DAC_I_Tol-SP,  CH_ARCH=BR:A3-PS{6A:CY4}I:DAC_I_Arch-I, CH_DIFFREF=BR:A3-PS{6A:CY4}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR:A3-PS{6A:CY4}I:DAC_I_DiffArch-I, CH_FLG=BR:A3-PS{6A:CY4}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:CY4}I:DAC_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:CY4}I:DAC-I, CH_REF=BR:A3-PS{6A:CY4}I:DAC-I_Ref, CH_DIFFREF=BR:A3-PS{6A:CY4}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:CY4}I:DAC-I, CH_REF=BR:A3-PS{6A:CY4}I-SP-1k, CH_DIFFREF=BR:A3-PS{6A:CY4}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A3-PS{6A:CY4}E:PS-I, CH_REF=BR:A3-PS{6A:CY4}E:PS-I_Ref, CH_TOL=BR:A3-PS{6A:CY4}E:PS_I_Tol-SP, CH_ARCH=BR:A3-PS{6A:CY4}E:PS_I_Arch-I, CH_DIFFREF=BR:A3-PS{6A:CY4}E:PS_I_DiffRef-I, CH_DIFFARCH=BR:A3-PS{6A:CY4}E:PS_I_DiffArch-I, CH_FLG=BR:A3-PS{6A:CY4}E:PS_I_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:CY4}E:PS_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:CY4}E:PS-I, CH_REF=BR:A3-PS{6A:CY4}E:PS-I_Ref, CH_DIFFREF=BR:A3-PS{6A:CY4}E:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A3-PS{6A:CY4}Cmd:PwrOn-Cmd, CH_REF=BR:A3-PS{6A:CY4}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:A3-PS{6A:CY4}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:A3-PS{6A:CY4}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:CY4}Cmd:PwrOn_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A3-PS{6A:CY4}Cmd:PwrOn-Cmd, CH_REF=BR:A3-PS{6A:CY4}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:A3-PS{6A:CY4}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A3-PS{6A:CY4}Sts:PSworks-Sts, CH_REF=BR:A3-PS{6A:CY4}Sts:PSworks-Sts_Ref, CH_ARCH=BR:A3-PS{6A:CY4}Sts:PSworks_Arch-Sts, CH_FLG=BR:A3-PS{6A:CY4}Sts:PSworks_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:CY4}Sts:PSworks_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A3-PS{6A:CY4}Sts:PSworks-Sts, CH_REF=BR:A3-PS{6A:CY4}Sts:PSworks-Sts_Ref, CH_FLG=BR:A3-PS{6A:CY4}Sts:PSworks_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")


# PSC36 Chan 0
# BR:A3-PS{6A:SD1} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:A3-PS{6A:SD1}I-SP,              OUTPUT=BR{PSC36}DAC:0-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC36}ADC:00-I,    OUTPUT=BR:A3-PS{6A:SD1}I-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC36}ADC:01-I,    OUTPUT=BR:A3-PS{6A:SD1}I:DAC-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC36}ADC:02-I,    OUTPUT=BR:A3-PS{6A:SD1}E:PS-I,      WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:A3-PS{6A:SD1}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC36}DO:1-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC36}DI:01-Sts,   OUTPUT=BR:A3-PS{6A:SD1}Sts:PSworks-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:A3-PS{6A:SD1}I-SP, OUTPUT=BR:A3-PS{6A:SD1}I-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:A3-PS{6A:SD1}I-SP-1k, OUTPUT=BR:A3-PS{6A:SD1}I-SP-1k-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A3-PS{6A:SD1}I-SP-1k, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A3-PS{6A:SD1}I-I,     OUTPUT=BR:A3-PS{6A:SD1}I-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A3-PS{6A:SD1}I-I,     WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A3-PS{6A:SD1}I:DAC-I, OUTPUT=BR:A3-PS{6A:SD1}I:DAC-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A3-PS{6A:SD1}I:DAC-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A3-PS{6A:SD1}E:PS-I,  OUTPUT=BR:A3-PS{6A:SD1}E:PS-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A3-PS{6A:SD1}E:PS-I,  WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A3-PS{6A:SD1}I-SP, CH_REF=BR:A3-PS{6A:SD1}I-SP_Ref, CH_TOL=BR:A3-PS{6A:SD1}I_SP_Tol-SP, CH_ARCH=BR:A3-PS{6A:SD1}I_SP_Arch-I, CH_DIFFREF=BR:A3-PS{6A:SD1}I_SP_DiffRef-I, CH_DIFFARCH=BR:A3-PS{6A:SD1}I_SP_DiffArch-I, CH_FLG=BR:A3-PS{6A:SD1}I_SP_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:SD1}I_SP_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:SD1}I-SP, CH_REF=BR:A3-PS{6A:SD1}I-SP_Ref, CH_DIFFREF=BR:A3-PS{6A:SD1}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A3-PS{6A:SD1}I-I, CH_REF=BR:A3-PS{6A:SD1}I-I_Ref, CH_TOL=BR:A3-PS{6A:SD1}I_I_Tol-SP, CH_ARCH=BR:A3-PS{6A:SD1}I_I_Arch-I, CH_DIFFREF=BR:A3-PS{6A:SD1}I_I_DiffRef-I, CH_DIFFARCH=BR:A3-PS{6A:SD1}I_I_DiffArch-I, CH_FLG=BR:A3-PS{6A:SD1}I_I_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:SD1}I_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:SD1}I-I, CH_REF=BR:A3-PS{6A:SD1}I-I_Ref, CH_DIFFREF=BR:A3-PS{6A:SD1}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:SD1}I-I, CH_REF=BR:A3-PS{6A:SD1}I-SP-1k, CH_DIFFREF=BR:A3-PS{6A:SD1}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A3-PS{6A:SD1}I:DAC-I, CH_REF=BR:A3-PS{6A:SD1}I:DAC-I_Ref, CH_TOL=BR:A3-PS{6A:SD1}I:DAC_I_Tol-SP,  CH_ARCH=BR:A3-PS{6A:SD1}I:DAC_I_Arch-I, CH_DIFFREF=BR:A3-PS{6A:SD1}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR:A3-PS{6A:SD1}I:DAC_I_DiffArch-I, CH_FLG=BR:A3-PS{6A:SD1}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:SD1}I:DAC_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:SD1}I:DAC-I, CH_REF=BR:A3-PS{6A:SD1}I:DAC-I_Ref, CH_DIFFREF=BR:A3-PS{6A:SD1}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:SD1}I:DAC-I, CH_REF=BR:A3-PS{6A:SD1}I-SP-1k, CH_DIFFREF=BR:A3-PS{6A:SD1}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A3-PS{6A:SD1}E:PS-I, CH_REF=BR:A3-PS{6A:SD1}E:PS-I_Ref, CH_TOL=BR:A3-PS{6A:SD1}E:PS_I_Tol-SP, CH_ARCH=BR:A3-PS{6A:SD1}E:PS_I_Arch-I, CH_DIFFREF=BR:A3-PS{6A:SD1}E:PS_I_DiffRef-I, CH_DIFFARCH=BR:A3-PS{6A:SD1}E:PS_I_DiffArch-I, CH_FLG=BR:A3-PS{6A:SD1}E:PS_I_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:SD1}E:PS_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:SD1}E:PS-I, CH_REF=BR:A3-PS{6A:SD1}E:PS-I_Ref, CH_DIFFREF=BR:A3-PS{6A:SD1}E:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A3-PS{6A:SD1}Cmd:PwrOn-Cmd, CH_REF=BR:A3-PS{6A:SD1}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:A3-PS{6A:SD1}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:A3-PS{6A:SD1}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:SD1}Cmd:PwrOn_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A3-PS{6A:SD1}Cmd:PwrOn-Cmd, CH_REF=BR:A3-PS{6A:SD1}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:A3-PS{6A:SD1}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A3-PS{6A:SD1}Sts:PSworks-Sts, CH_REF=BR:A3-PS{6A:SD1}Sts:PSworks-Sts_Ref, CH_ARCH=BR:A3-PS{6A:SD1}Sts:PSworks_Arch-Sts, CH_FLG=BR:A3-PS{6A:SD1}Sts:PSworks_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:SD1}Sts:PSworks_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A3-PS{6A:SD1}Sts:PSworks-Sts, CH_REF=BR:A3-PS{6A:SD1}Sts:PSworks-Sts_Ref, CH_FLG=BR:A3-PS{6A:SD1}Sts:PSworks_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")


# PSC36 Chan 1
# BR:A3-PS{6A:SD2} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:A3-PS{6A:SD2}I-SP,              OUTPUT=BR{PSC36}DAC:1-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC36}ADC:08-I,    OUTPUT=BR:A3-PS{6A:SD2}I-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC36}ADC:09-I,    OUTPUT=BR:A3-PS{6A:SD2}I:DAC-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC36}ADC:10-I,    OUTPUT=BR:A3-PS{6A:SD2}E:PS-I,      WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:A3-PS{6A:SD2}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC36}DO:0-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC36}DI:00-Sts,   OUTPUT=BR:A3-PS{6A:SD2}Sts:PSworks-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:A3-PS{6A:SD2}I-SP, OUTPUT=BR:A3-PS{6A:SD2}I-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:A3-PS{6A:SD2}I-SP-1k, OUTPUT=BR:A3-PS{6A:SD2}I-SP-1k-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A3-PS{6A:SD2}I-SP-1k, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A3-PS{6A:SD2}I-I,     OUTPUT=BR:A3-PS{6A:SD2}I-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A3-PS{6A:SD2}I-I,     WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A3-PS{6A:SD2}I:DAC-I, OUTPUT=BR:A3-PS{6A:SD2}I:DAC-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A3-PS{6A:SD2}I:DAC-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A3-PS{6A:SD2}E:PS-I,  OUTPUT=BR:A3-PS{6A:SD2}E:PS-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A3-PS{6A:SD2}E:PS-I,  WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A3-PS{6A:SD2}I-SP, CH_REF=BR:A3-PS{6A:SD2}I-SP_Ref, CH_TOL=BR:A3-PS{6A:SD2}I_SP_Tol-SP, CH_ARCH=BR:A3-PS{6A:SD2}I_SP_Arch-I, CH_DIFFREF=BR:A3-PS{6A:SD2}I_SP_DiffRef-I, CH_DIFFARCH=BR:A3-PS{6A:SD2}I_SP_DiffArch-I, CH_FLG=BR:A3-PS{6A:SD2}I_SP_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:SD2}I_SP_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:SD2}I-SP, CH_REF=BR:A3-PS{6A:SD2}I-SP_Ref, CH_DIFFREF=BR:A3-PS{6A:SD2}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A3-PS{6A:SD2}I-I, CH_REF=BR:A3-PS{6A:SD2}I-I_Ref, CH_TOL=BR:A3-PS{6A:SD2}I_I_Tol-SP, CH_ARCH=BR:A3-PS{6A:SD2}I_I_Arch-I, CH_DIFFREF=BR:A3-PS{6A:SD2}I_I_DiffRef-I, CH_DIFFARCH=BR:A3-PS{6A:SD2}I_I_DiffArch-I, CH_FLG=BR:A3-PS{6A:SD2}I_I_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:SD2}I_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:SD2}I-I, CH_REF=BR:A3-PS{6A:SD2}I-I_Ref, CH_DIFFREF=BR:A3-PS{6A:SD2}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:SD2}I-I, CH_REF=BR:A3-PS{6A:SD2}I-SP-1k, CH_DIFFREF=BR:A3-PS{6A:SD2}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A3-PS{6A:SD2}I:DAC-I, CH_REF=BR:A3-PS{6A:SD2}I:DAC-I_Ref, CH_TOL=BR:A3-PS{6A:SD2}I:DAC_I_Tol-SP,  CH_ARCH=BR:A3-PS{6A:SD2}I:DAC_I_Arch-I, CH_DIFFREF=BR:A3-PS{6A:SD2}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR:A3-PS{6A:SD2}I:DAC_I_DiffArch-I, CH_FLG=BR:A3-PS{6A:SD2}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:SD2}I:DAC_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:SD2}I:DAC-I, CH_REF=BR:A3-PS{6A:SD2}I:DAC-I_Ref, CH_DIFFREF=BR:A3-PS{6A:SD2}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:SD2}I:DAC-I, CH_REF=BR:A3-PS{6A:SD2}I-SP-1k, CH_DIFFREF=BR:A3-PS{6A:SD2}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A3-PS{6A:SD2}E:PS-I, CH_REF=BR:A3-PS{6A:SD2}E:PS-I_Ref, CH_TOL=BR:A3-PS{6A:SD2}E:PS_I_Tol-SP, CH_ARCH=BR:A3-PS{6A:SD2}E:PS_I_Arch-I, CH_DIFFREF=BR:A3-PS{6A:SD2}E:PS_I_DiffRef-I, CH_DIFFARCH=BR:A3-PS{6A:SD2}E:PS_I_DiffArch-I, CH_FLG=BR:A3-PS{6A:SD2}E:PS_I_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:SD2}E:PS_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:SD2}E:PS-I, CH_REF=BR:A3-PS{6A:SD2}E:PS-I_Ref, CH_DIFFREF=BR:A3-PS{6A:SD2}E:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A3-PS{6A:SD2}Cmd:PwrOn-Cmd, CH_REF=BR:A3-PS{6A:SD2}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:A3-PS{6A:SD2}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:A3-PS{6A:SD2}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:SD2}Cmd:PwrOn_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A3-PS{6A:SD2}Cmd:PwrOn-Cmd, CH_REF=BR:A3-PS{6A:SD2}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:A3-PS{6A:SD2}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A3-PS{6A:SD2}Sts:PSworks-Sts, CH_REF=BR:A3-PS{6A:SD2}Sts:PSworks-Sts_Ref, CH_ARCH=BR:A3-PS{6A:SD2}Sts:PSworks_Arch-Sts, CH_FLG=BR:A3-PS{6A:SD2}Sts:PSworks_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:SD2}Sts:PSworks_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A3-PS{6A:SD2}Sts:PSworks-Sts, CH_REF=BR:A3-PS{6A:SD2}Sts:PSworks-Sts_Ref, CH_FLG=BR:A3-PS{6A:SD2}Sts:PSworks_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")


# PSC37 Chan 0
# BR:A3-PS{6A:SF2} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:A3-PS{6A:SF2}I-SP,              OUTPUT=BR{PSC37}DAC:0-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC37}ADC:00-I,    OUTPUT=BR:A3-PS{6A:SF2}I-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC37}ADC:01-I,    OUTPUT=BR:A3-PS{6A:SF2}I:DAC-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC37}ADC:02-I,    OUTPUT=BR:A3-PS{6A:SF2}E:PS-I,      WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:A3-PS{6A:SF2}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC37}DO:1-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC37}DI:01-Sts,   OUTPUT=BR:A3-PS{6A:SF2}Sts:PSworks-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:A3-PS{6A:SF2}I-SP, OUTPUT=BR:A3-PS{6A:SF2}I-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:A3-PS{6A:SF2}I-SP-1k, OUTPUT=BR:A3-PS{6A:SF2}I-SP-1k-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A3-PS{6A:SF2}I-SP-1k, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A3-PS{6A:SF2}I-I,     OUTPUT=BR:A3-PS{6A:SF2}I-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A3-PS{6A:SF2}I-I,     WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A3-PS{6A:SF2}I:DAC-I, OUTPUT=BR:A3-PS{6A:SF2}I:DAC-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A3-PS{6A:SF2}I:DAC-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A3-PS{6A:SF2}E:PS-I,  OUTPUT=BR:A3-PS{6A:SF2}E:PS-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A3-PS{6A:SF2}E:PS-I,  WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A3-PS{6A:SF2}I-SP, CH_REF=BR:A3-PS{6A:SF2}I-SP_Ref, CH_TOL=BR:A3-PS{6A:SF2}I_SP_Tol-SP, CH_ARCH=BR:A3-PS{6A:SF2}I_SP_Arch-I, CH_DIFFREF=BR:A3-PS{6A:SF2}I_SP_DiffRef-I, CH_DIFFARCH=BR:A3-PS{6A:SF2}I_SP_DiffArch-I, CH_FLG=BR:A3-PS{6A:SF2}I_SP_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:SF2}I_SP_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:SF2}I-SP, CH_REF=BR:A3-PS{6A:SF2}I-SP_Ref, CH_DIFFREF=BR:A3-PS{6A:SF2}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A3-PS{6A:SF2}I-I, CH_REF=BR:A3-PS{6A:SF2}I-I_Ref, CH_TOL=BR:A3-PS{6A:SF2}I_I_Tol-SP, CH_ARCH=BR:A3-PS{6A:SF2}I_I_Arch-I, CH_DIFFREF=BR:A3-PS{6A:SF2}I_I_DiffRef-I, CH_DIFFARCH=BR:A3-PS{6A:SF2}I_I_DiffArch-I, CH_FLG=BR:A3-PS{6A:SF2}I_I_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:SF2}I_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:SF2}I-I, CH_REF=BR:A3-PS{6A:SF2}I-I_Ref, CH_DIFFREF=BR:A3-PS{6A:SF2}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:SF2}I-I, CH_REF=BR:A3-PS{6A:SF2}I-SP-1k, CH_DIFFREF=BR:A3-PS{6A:SF2}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A3-PS{6A:SF2}I:DAC-I, CH_REF=BR:A3-PS{6A:SF2}I:DAC-I_Ref, CH_TOL=BR:A3-PS{6A:SF2}I:DAC_I_Tol-SP,  CH_ARCH=BR:A3-PS{6A:SF2}I:DAC_I_Arch-I, CH_DIFFREF=BR:A3-PS{6A:SF2}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR:A3-PS{6A:SF2}I:DAC_I_DiffArch-I, CH_FLG=BR:A3-PS{6A:SF2}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:SF2}I:DAC_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:SF2}I:DAC-I, CH_REF=BR:A3-PS{6A:SF2}I:DAC-I_Ref, CH_DIFFREF=BR:A3-PS{6A:SF2}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:SF2}I:DAC-I, CH_REF=BR:A3-PS{6A:SF2}I-SP-1k, CH_DIFFREF=BR:A3-PS{6A:SF2}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A3-PS{6A:SF2}E:PS-I, CH_REF=BR:A3-PS{6A:SF2}E:PS-I_Ref, CH_TOL=BR:A3-PS{6A:SF2}E:PS_I_Tol-SP, CH_ARCH=BR:A3-PS{6A:SF2}E:PS_I_Arch-I, CH_DIFFREF=BR:A3-PS{6A:SF2}E:PS_I_DiffRef-I, CH_DIFFARCH=BR:A3-PS{6A:SF2}E:PS_I_DiffArch-I, CH_FLG=BR:A3-PS{6A:SF2}E:PS_I_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:SF2}E:PS_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A3-PS{6A:SF2}E:PS-I, CH_REF=BR:A3-PS{6A:SF2}E:PS-I_Ref, CH_DIFFREF=BR:A3-PS{6A:SF2}E:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A3-PS{6A:SF2}Cmd:PwrOn-Cmd, CH_REF=BR:A3-PS{6A:SF2}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:A3-PS{6A:SF2}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:A3-PS{6A:SF2}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:SF2}Cmd:PwrOn_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A3-PS{6A:SF2}Cmd:PwrOn-Cmd, CH_REF=BR:A3-PS{6A:SF2}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:A3-PS{6A:SF2}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A3-PS{6A:SF2}Sts:PSworks-Sts, CH_REF=BR:A3-PS{6A:SF2}Sts:PSworks-Sts_Ref, CH_ARCH=BR:A3-PS{6A:SF2}Sts:PSworks_Arch-Sts, CH_FLG=BR:A3-PS{6A:SF2}Sts:PSworks_MonitFlg-Sts, CH_FLGARCH=BR:A3-PS{6A:SF2}Sts:PSworks_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A3-PS{6A:SF2}Sts:PSworks-Sts, CH_REF=BR:A3-PS{6A:SF2}Sts:PSworks-Sts_Ref, CH_FLG=BR:A3-PS{6A:SF2}Sts:PSworks_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")


# PSC37 Channel: 1  no PS

# PSC38 Chan 0
# BR:IS-PS{6A:CXW2} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:IS-PS{6A:CXW2}I-SP,              OUTPUT=BR{PSC38}DAC:0-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC38}ADC:00-I,    OUTPUT=BR:IS-PS{6A:CXW2}I-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC38}ADC:01-I,    OUTPUT=BR:IS-PS{6A:CXW2}I:DAC-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC38}ADC:02-I,    OUTPUT=BR:IS-PS{6A:CXW2}E:PS-I,      WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:IS-PS{6A:CXW2}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC38}DO:1-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC38}DI:01-Sts,   OUTPUT=BR:IS-PS{6A:CXW2}Sts:PSworks-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:IS-PS{6A:CXW2}I-SP, OUTPUT=BR:IS-PS{6A:CXW2}I-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:IS-PS{6A:CXW2}I-SP-1k, OUTPUT=BR:IS-PS{6A:CXW2}I-SP-1k-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:IS-PS{6A:CXW2}I-SP-1k, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:IS-PS{6A:CXW2}I-I,     OUTPUT=BR:IS-PS{6A:CXW2}I-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:IS-PS{6A:CXW2}I-I,     WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:IS-PS{6A:CXW2}I:DAC-I, OUTPUT=BR:IS-PS{6A:CXW2}I:DAC-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:IS-PS{6A:CXW2}I:DAC-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:IS-PS{6A:CXW2}E:PS-I,  OUTPUT=BR:IS-PS{6A:CXW2}E:PS-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:IS-PS{6A:CXW2}E:PS-I,  WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:IS-PS{6A:CXW2}I-SP, CH_REF=BR:IS-PS{6A:CXW2}I-SP_Ref, CH_TOL=BR:IS-PS{6A:CXW2}I_SP_Tol-SP, CH_ARCH=BR:IS-PS{6A:CXW2}I_SP_Arch-I, CH_DIFFREF=BR:IS-PS{6A:CXW2}I_SP_DiffRef-I, CH_DIFFARCH=BR:IS-PS{6A:CXW2}I_SP_DiffArch-I, CH_FLG=BR:IS-PS{6A:CXW2}I_SP_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{6A:CXW2}I_SP_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{6A:CXW2}I-SP, CH_REF=BR:IS-PS{6A:CXW2}I-SP_Ref, CH_DIFFREF=BR:IS-PS{6A:CXW2}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:IS-PS{6A:CXW2}I-I, CH_REF=BR:IS-PS{6A:CXW2}I-I_Ref, CH_TOL=BR:IS-PS{6A:CXW2}I_I_Tol-SP, CH_ARCH=BR:IS-PS{6A:CXW2}I_I_Arch-I, CH_DIFFREF=BR:IS-PS{6A:CXW2}I_I_DiffRef-I, CH_DIFFARCH=BR:IS-PS{6A:CXW2}I_I_DiffArch-I, CH_FLG=BR:IS-PS{6A:CXW2}I_I_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{6A:CXW2}I_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{6A:CXW2}I-I, CH_REF=BR:IS-PS{6A:CXW2}I-I_Ref, CH_DIFFREF=BR:IS-PS{6A:CXW2}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{6A:CXW2}I-I, CH_REF=BR:IS-PS{6A:CXW2}I-SP-1k, CH_DIFFREF=BR:IS-PS{6A:CXW2}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:IS-PS{6A:CXW2}I:DAC-I, CH_REF=BR:IS-PS{6A:CXW2}I:DAC-I_Ref, CH_TOL=BR:IS-PS{6A:CXW2}I:DAC_I_Tol-SP,  CH_ARCH=BR:IS-PS{6A:CXW2}I:DAC_I_Arch-I, CH_DIFFREF=BR:IS-PS{6A:CXW2}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR:IS-PS{6A:CXW2}I:DAC_I_DiffArch-I, CH_FLG=BR:IS-PS{6A:CXW2}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{6A:CXW2}I:DAC_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{6A:CXW2}I:DAC-I, CH_REF=BR:IS-PS{6A:CXW2}I:DAC-I_Ref, CH_DIFFREF=BR:IS-PS{6A:CXW2}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{6A:CXW2}I:DAC-I, CH_REF=BR:IS-PS{6A:CXW2}I-SP-1k, CH_DIFFREF=BR:IS-PS{6A:CXW2}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:IS-PS{6A:CXW2}E:PS-I, CH_REF=BR:IS-PS{6A:CXW2}E:PS-I_Ref, CH_TOL=BR:IS-PS{6A:CXW2}E:PS_I_Tol-SP, CH_ARCH=BR:IS-PS{6A:CXW2}E:PS_I_Arch-I, CH_DIFFREF=BR:IS-PS{6A:CXW2}E:PS_I_DiffRef-I, CH_DIFFARCH=BR:IS-PS{6A:CXW2}E:PS_I_DiffArch-I, CH_FLG=BR:IS-PS{6A:CXW2}E:PS_I_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{6A:CXW2}E:PS_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{6A:CXW2}E:PS-I, CH_REF=BR:IS-PS{6A:CXW2}E:PS-I_Ref, CH_DIFFREF=BR:IS-PS{6A:CXW2}E:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{6A:CXW2}Cmd:PwrOn-Cmd, CH_REF=BR:IS-PS{6A:CXW2}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:IS-PS{6A:CXW2}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:IS-PS{6A:CXW2}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{6A:CXW2}Cmd:PwrOn_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{6A:CXW2}Cmd:PwrOn-Cmd, CH_REF=BR:IS-PS{6A:CXW2}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:IS-PS{6A:CXW2}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{6A:CXW2}Sts:PSworks-Sts, CH_REF=BR:IS-PS{6A:CXW2}Sts:PSworks-Sts_Ref, CH_ARCH=BR:IS-PS{6A:CXW2}Sts:PSworks_Arch-Sts, CH_FLG=BR:IS-PS{6A:CXW2}Sts:PSworks_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{6A:CXW2}Sts:PSworks_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{6A:CXW2}Sts:PSworks-Sts, CH_REF=BR:IS-PS{6A:CXW2}Sts:PSworks-Sts_Ref, CH_FLG=BR:IS-PS{6A:CXW2}Sts:PSworks_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")


# PSC38 Chan 1
# BR:A4-PS{6A:CX1} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:A4-PS{6A:CX1}I-SP,              OUTPUT=BR{PSC38}DAC:1-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC38}ADC:08-I,    OUTPUT=BR:A4-PS{6A:CX1}I-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC38}ADC:09-I,    OUTPUT=BR:A4-PS{6A:CX1}I:DAC-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC38}ADC:10-I,    OUTPUT=BR:A4-PS{6A:CX1}E:PS-I,      WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:A4-PS{6A:CX1}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC38}DO:0-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC38}DI:00-Sts,   OUTPUT=BR:A4-PS{6A:CX1}Sts:PSworks-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:A4-PS{6A:CX1}I-SP, OUTPUT=BR:A4-PS{6A:CX1}I-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:A4-PS{6A:CX1}I-SP-1k, OUTPUT=BR:A4-PS{6A:CX1}I-SP-1k-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A4-PS{6A:CX1}I-SP-1k, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A4-PS{6A:CX1}I-I,     OUTPUT=BR:A4-PS{6A:CX1}I-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A4-PS{6A:CX1}I-I,     WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A4-PS{6A:CX1}I:DAC-I, OUTPUT=BR:A4-PS{6A:CX1}I:DAC-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A4-PS{6A:CX1}I:DAC-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A4-PS{6A:CX1}E:PS-I,  OUTPUT=BR:A4-PS{6A:CX1}E:PS-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A4-PS{6A:CX1}E:PS-I,  WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A4-PS{6A:CX1}I-SP, CH_REF=BR:A4-PS{6A:CX1}I-SP_Ref, CH_TOL=BR:A4-PS{6A:CX1}I_SP_Tol-SP, CH_ARCH=BR:A4-PS{6A:CX1}I_SP_Arch-I, CH_DIFFREF=BR:A4-PS{6A:CX1}I_SP_DiffRef-I, CH_DIFFARCH=BR:A4-PS{6A:CX1}I_SP_DiffArch-I, CH_FLG=BR:A4-PS{6A:CX1}I_SP_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:CX1}I_SP_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:CX1}I-SP, CH_REF=BR:A4-PS{6A:CX1}I-SP_Ref, CH_DIFFREF=BR:A4-PS{6A:CX1}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A4-PS{6A:CX1}I-I, CH_REF=BR:A4-PS{6A:CX1}I-I_Ref, CH_TOL=BR:A4-PS{6A:CX1}I_I_Tol-SP, CH_ARCH=BR:A4-PS{6A:CX1}I_I_Arch-I, CH_DIFFREF=BR:A4-PS{6A:CX1}I_I_DiffRef-I, CH_DIFFARCH=BR:A4-PS{6A:CX1}I_I_DiffArch-I, CH_FLG=BR:A4-PS{6A:CX1}I_I_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:CX1}I_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:CX1}I-I, CH_REF=BR:A4-PS{6A:CX1}I-I_Ref, CH_DIFFREF=BR:A4-PS{6A:CX1}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:CX1}I-I, CH_REF=BR:A4-PS{6A:CX1}I-SP-1k, CH_DIFFREF=BR:A4-PS{6A:CX1}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A4-PS{6A:CX1}I:DAC-I, CH_REF=BR:A4-PS{6A:CX1}I:DAC-I_Ref, CH_TOL=BR:A4-PS{6A:CX1}I:DAC_I_Tol-SP,  CH_ARCH=BR:A4-PS{6A:CX1}I:DAC_I_Arch-I, CH_DIFFREF=BR:A4-PS{6A:CX1}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR:A4-PS{6A:CX1}I:DAC_I_DiffArch-I, CH_FLG=BR:A4-PS{6A:CX1}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:CX1}I:DAC_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:CX1}I:DAC-I, CH_REF=BR:A4-PS{6A:CX1}I:DAC-I_Ref, CH_DIFFREF=BR:A4-PS{6A:CX1}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:CX1}I:DAC-I, CH_REF=BR:A4-PS{6A:CX1}I-SP-1k, CH_DIFFREF=BR:A4-PS{6A:CX1}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A4-PS{6A:CX1}E:PS-I, CH_REF=BR:A4-PS{6A:CX1}E:PS-I_Ref, CH_TOL=BR:A4-PS{6A:CX1}E:PS_I_Tol-SP, CH_ARCH=BR:A4-PS{6A:CX1}E:PS_I_Arch-I, CH_DIFFREF=BR:A4-PS{6A:CX1}E:PS_I_DiffRef-I, CH_DIFFARCH=BR:A4-PS{6A:CX1}E:PS_I_DiffArch-I, CH_FLG=BR:A4-PS{6A:CX1}E:PS_I_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:CX1}E:PS_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:CX1}E:PS-I, CH_REF=BR:A4-PS{6A:CX1}E:PS-I_Ref, CH_DIFFREF=BR:A4-PS{6A:CX1}E:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A4-PS{6A:CX1}Cmd:PwrOn-Cmd, CH_REF=BR:A4-PS{6A:CX1}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:A4-PS{6A:CX1}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:A4-PS{6A:CX1}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:CX1}Cmd:PwrOn_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A4-PS{6A:CX1}Cmd:PwrOn-Cmd, CH_REF=BR:A4-PS{6A:CX1}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:A4-PS{6A:CX1}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A4-PS{6A:CX1}Sts:PSworks-Sts, CH_REF=BR:A4-PS{6A:CX1}Sts:PSworks-Sts_Ref, CH_ARCH=BR:A4-PS{6A:CX1}Sts:PSworks_Arch-Sts, CH_FLG=BR:A4-PS{6A:CX1}Sts:PSworks_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:CX1}Sts:PSworks_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A4-PS{6A:CX1}Sts:PSworks-Sts, CH_REF=BR:A4-PS{6A:CX1}Sts:PSworks-Sts_Ref, CH_FLG=BR:A4-PS{6A:CX1}Sts:PSworks_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")


# PSC39 Chan 0
# BR:A4-PS{6A:CX2} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:A4-PS{6A:CX2}I-SP,              OUTPUT=BR{PSC39}DAC:0-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC39}ADC:00-I,    OUTPUT=BR:A4-PS{6A:CX2}I-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC39}ADC:01-I,    OUTPUT=BR:A4-PS{6A:CX2}I:DAC-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC39}ADC:02-I,    OUTPUT=BR:A4-PS{6A:CX2}E:PS-I,      WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:A4-PS{6A:CX2}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC39}DO:1-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC39}DI:01-Sts,   OUTPUT=BR:A4-PS{6A:CX2}Sts:PSworks-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:A4-PS{6A:CX2}I-SP, OUTPUT=BR:A4-PS{6A:CX2}I-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:A4-PS{6A:CX2}I-SP-1k, OUTPUT=BR:A4-PS{6A:CX2}I-SP-1k-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A4-PS{6A:CX2}I-SP-1k, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A4-PS{6A:CX2}I-I,     OUTPUT=BR:A4-PS{6A:CX2}I-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A4-PS{6A:CX2}I-I,     WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A4-PS{6A:CX2}I:DAC-I, OUTPUT=BR:A4-PS{6A:CX2}I:DAC-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A4-PS{6A:CX2}I:DAC-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A4-PS{6A:CX2}E:PS-I,  OUTPUT=BR:A4-PS{6A:CX2}E:PS-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A4-PS{6A:CX2}E:PS-I,  WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A4-PS{6A:CX2}I-SP, CH_REF=BR:A4-PS{6A:CX2}I-SP_Ref, CH_TOL=BR:A4-PS{6A:CX2}I_SP_Tol-SP, CH_ARCH=BR:A4-PS{6A:CX2}I_SP_Arch-I, CH_DIFFREF=BR:A4-PS{6A:CX2}I_SP_DiffRef-I, CH_DIFFARCH=BR:A4-PS{6A:CX2}I_SP_DiffArch-I, CH_FLG=BR:A4-PS{6A:CX2}I_SP_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:CX2}I_SP_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:CX2}I-SP, CH_REF=BR:A4-PS{6A:CX2}I-SP_Ref, CH_DIFFREF=BR:A4-PS{6A:CX2}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A4-PS{6A:CX2}I-I, CH_REF=BR:A4-PS{6A:CX2}I-I_Ref, CH_TOL=BR:A4-PS{6A:CX2}I_I_Tol-SP, CH_ARCH=BR:A4-PS{6A:CX2}I_I_Arch-I, CH_DIFFREF=BR:A4-PS{6A:CX2}I_I_DiffRef-I, CH_DIFFARCH=BR:A4-PS{6A:CX2}I_I_DiffArch-I, CH_FLG=BR:A4-PS{6A:CX2}I_I_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:CX2}I_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:CX2}I-I, CH_REF=BR:A4-PS{6A:CX2}I-I_Ref, CH_DIFFREF=BR:A4-PS{6A:CX2}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:CX2}I-I, CH_REF=BR:A4-PS{6A:CX2}I-SP-1k, CH_DIFFREF=BR:A4-PS{6A:CX2}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A4-PS{6A:CX2}I:DAC-I, CH_REF=BR:A4-PS{6A:CX2}I:DAC-I_Ref, CH_TOL=BR:A4-PS{6A:CX2}I:DAC_I_Tol-SP,  CH_ARCH=BR:A4-PS{6A:CX2}I:DAC_I_Arch-I, CH_DIFFREF=BR:A4-PS{6A:CX2}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR:A4-PS{6A:CX2}I:DAC_I_DiffArch-I, CH_FLG=BR:A4-PS{6A:CX2}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:CX2}I:DAC_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:CX2}I:DAC-I, CH_REF=BR:A4-PS{6A:CX2}I:DAC-I_Ref, CH_DIFFREF=BR:A4-PS{6A:CX2}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:CX2}I:DAC-I, CH_REF=BR:A4-PS{6A:CX2}I-SP-1k, CH_DIFFREF=BR:A4-PS{6A:CX2}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A4-PS{6A:CX2}E:PS-I, CH_REF=BR:A4-PS{6A:CX2}E:PS-I_Ref, CH_TOL=BR:A4-PS{6A:CX2}E:PS_I_Tol-SP, CH_ARCH=BR:A4-PS{6A:CX2}E:PS_I_Arch-I, CH_DIFFREF=BR:A4-PS{6A:CX2}E:PS_I_DiffRef-I, CH_DIFFARCH=BR:A4-PS{6A:CX2}E:PS_I_DiffArch-I, CH_FLG=BR:A4-PS{6A:CX2}E:PS_I_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:CX2}E:PS_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:CX2}E:PS-I, CH_REF=BR:A4-PS{6A:CX2}E:PS-I_Ref, CH_DIFFREF=BR:A4-PS{6A:CX2}E:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A4-PS{6A:CX2}Cmd:PwrOn-Cmd, CH_REF=BR:A4-PS{6A:CX2}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:A4-PS{6A:CX2}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:A4-PS{6A:CX2}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:CX2}Cmd:PwrOn_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A4-PS{6A:CX2}Cmd:PwrOn-Cmd, CH_REF=BR:A4-PS{6A:CX2}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:A4-PS{6A:CX2}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A4-PS{6A:CX2}Sts:PSworks-Sts, CH_REF=BR:A4-PS{6A:CX2}Sts:PSworks-Sts_Ref, CH_ARCH=BR:A4-PS{6A:CX2}Sts:PSworks_Arch-Sts, CH_FLG=BR:A4-PS{6A:CX2}Sts:PSworks_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:CX2}Sts:PSworks_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A4-PS{6A:CX2}Sts:PSworks-Sts, CH_REF=BR:A4-PS{6A:CX2}Sts:PSworks-Sts_Ref, CH_FLG=BR:A4-PS{6A:CX2}Sts:PSworks_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")


# PSC39 Chan 1
# BR:A4-PS{6A:CX3} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:A4-PS{6A:CX3}I-SP,              OUTPUT=BR{PSC39}DAC:1-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC39}ADC:08-I,    OUTPUT=BR:A4-PS{6A:CX3}I-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC39}ADC:09-I,    OUTPUT=BR:A4-PS{6A:CX3}I:DAC-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC39}ADC:10-I,    OUTPUT=BR:A4-PS{6A:CX3}E:PS-I,      WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:A4-PS{6A:CX3}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC39}DO:0-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC39}DI:00-Sts,   OUTPUT=BR:A4-PS{6A:CX3}Sts:PSworks-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:A4-PS{6A:CX3}I-SP, OUTPUT=BR:A4-PS{6A:CX3}I-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:A4-PS{6A:CX3}I-SP-1k, OUTPUT=BR:A4-PS{6A:CX3}I-SP-1k-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A4-PS{6A:CX3}I-SP-1k, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A4-PS{6A:CX3}I-I,     OUTPUT=BR:A4-PS{6A:CX3}I-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A4-PS{6A:CX3}I-I,     WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A4-PS{6A:CX3}I:DAC-I, OUTPUT=BR:A4-PS{6A:CX3}I:DAC-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A4-PS{6A:CX3}I:DAC-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A4-PS{6A:CX3}E:PS-I,  OUTPUT=BR:A4-PS{6A:CX3}E:PS-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A4-PS{6A:CX3}E:PS-I,  WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A4-PS{6A:CX3}I-SP, CH_REF=BR:A4-PS{6A:CX3}I-SP_Ref, CH_TOL=BR:A4-PS{6A:CX3}I_SP_Tol-SP, CH_ARCH=BR:A4-PS{6A:CX3}I_SP_Arch-I, CH_DIFFREF=BR:A4-PS{6A:CX3}I_SP_DiffRef-I, CH_DIFFARCH=BR:A4-PS{6A:CX3}I_SP_DiffArch-I, CH_FLG=BR:A4-PS{6A:CX3}I_SP_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:CX3}I_SP_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:CX3}I-SP, CH_REF=BR:A4-PS{6A:CX3}I-SP_Ref, CH_DIFFREF=BR:A4-PS{6A:CX3}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A4-PS{6A:CX3}I-I, CH_REF=BR:A4-PS{6A:CX3}I-I_Ref, CH_TOL=BR:A4-PS{6A:CX3}I_I_Tol-SP, CH_ARCH=BR:A4-PS{6A:CX3}I_I_Arch-I, CH_DIFFREF=BR:A4-PS{6A:CX3}I_I_DiffRef-I, CH_DIFFARCH=BR:A4-PS{6A:CX3}I_I_DiffArch-I, CH_FLG=BR:A4-PS{6A:CX3}I_I_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:CX3}I_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:CX3}I-I, CH_REF=BR:A4-PS{6A:CX3}I-I_Ref, CH_DIFFREF=BR:A4-PS{6A:CX3}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:CX3}I-I, CH_REF=BR:A4-PS{6A:CX3}I-SP-1k, CH_DIFFREF=BR:A4-PS{6A:CX3}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A4-PS{6A:CX3}I:DAC-I, CH_REF=BR:A4-PS{6A:CX3}I:DAC-I_Ref, CH_TOL=BR:A4-PS{6A:CX3}I:DAC_I_Tol-SP,  CH_ARCH=BR:A4-PS{6A:CX3}I:DAC_I_Arch-I, CH_DIFFREF=BR:A4-PS{6A:CX3}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR:A4-PS{6A:CX3}I:DAC_I_DiffArch-I, CH_FLG=BR:A4-PS{6A:CX3}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:CX3}I:DAC_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:CX3}I:DAC-I, CH_REF=BR:A4-PS{6A:CX3}I:DAC-I_Ref, CH_DIFFREF=BR:A4-PS{6A:CX3}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:CX3}I:DAC-I, CH_REF=BR:A4-PS{6A:CX3}I-SP-1k, CH_DIFFREF=BR:A4-PS{6A:CX3}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A4-PS{6A:CX3}E:PS-I, CH_REF=BR:A4-PS{6A:CX3}E:PS-I_Ref, CH_TOL=BR:A4-PS{6A:CX3}E:PS_I_Tol-SP, CH_ARCH=BR:A4-PS{6A:CX3}E:PS_I_Arch-I, CH_DIFFREF=BR:A4-PS{6A:CX3}E:PS_I_DiffRef-I, CH_DIFFARCH=BR:A4-PS{6A:CX3}E:PS_I_DiffArch-I, CH_FLG=BR:A4-PS{6A:CX3}E:PS_I_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:CX3}E:PS_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:CX3}E:PS-I, CH_REF=BR:A4-PS{6A:CX3}E:PS-I_Ref, CH_DIFFREF=BR:A4-PS{6A:CX3}E:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A4-PS{6A:CX3}Cmd:PwrOn-Cmd, CH_REF=BR:A4-PS{6A:CX3}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:A4-PS{6A:CX3}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:A4-PS{6A:CX3}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:CX3}Cmd:PwrOn_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A4-PS{6A:CX3}Cmd:PwrOn-Cmd, CH_REF=BR:A4-PS{6A:CX3}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:A4-PS{6A:CX3}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A4-PS{6A:CX3}Sts:PSworks-Sts, CH_REF=BR:A4-PS{6A:CX3}Sts:PSworks-Sts_Ref, CH_ARCH=BR:A4-PS{6A:CX3}Sts:PSworks_Arch-Sts, CH_FLG=BR:A4-PS{6A:CX3}Sts:PSworks_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:CX3}Sts:PSworks_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A4-PS{6A:CX3}Sts:PSworks-Sts, CH_REF=BR:A4-PS{6A:CX3}Sts:PSworks-Sts_Ref, CH_FLG=BR:A4-PS{6A:CX3}Sts:PSworks_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")


# PSC40 Chan 0
# BR:IS-PS{6A:CXW1} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:IS-PS{6A:CXW1}I-SP,              OUTPUT=BR{PSC40}DAC:0-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC40}ADC:00-I,    OUTPUT=BR:IS-PS{6A:CXW1}I-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC40}ADC:01-I,    OUTPUT=BR:IS-PS{6A:CXW1}I:DAC-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC40}ADC:02-I,    OUTPUT=BR:IS-PS{6A:CXW1}E:PS-I,      WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:IS-PS{6A:CXW1}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC40}DO:1-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC40}DI:01-Sts,   OUTPUT=BR:IS-PS{6A:CXW1}Sts:PSworks-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:IS-PS{6A:CXW1}I-SP, OUTPUT=BR:IS-PS{6A:CXW1}I-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:IS-PS{6A:CXW1}I-SP-1k, OUTPUT=BR:IS-PS{6A:CXW1}I-SP-1k-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:IS-PS{6A:CXW1}I-SP-1k, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:IS-PS{6A:CXW1}I-I,     OUTPUT=BR:IS-PS{6A:CXW1}I-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:IS-PS{6A:CXW1}I-I,     WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:IS-PS{6A:CXW1}I:DAC-I, OUTPUT=BR:IS-PS{6A:CXW1}I:DAC-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:IS-PS{6A:CXW1}I:DAC-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:IS-PS{6A:CXW1}E:PS-I,  OUTPUT=BR:IS-PS{6A:CXW1}E:PS-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:IS-PS{6A:CXW1}E:PS-I,  WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:IS-PS{6A:CXW1}I-SP, CH_REF=BR:IS-PS{6A:CXW1}I-SP_Ref, CH_TOL=BR:IS-PS{6A:CXW1}I_SP_Tol-SP, CH_ARCH=BR:IS-PS{6A:CXW1}I_SP_Arch-I, CH_DIFFREF=BR:IS-PS{6A:CXW1}I_SP_DiffRef-I, CH_DIFFARCH=BR:IS-PS{6A:CXW1}I_SP_DiffArch-I, CH_FLG=BR:IS-PS{6A:CXW1}I_SP_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{6A:CXW1}I_SP_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{6A:CXW1}I-SP, CH_REF=BR:IS-PS{6A:CXW1}I-SP_Ref, CH_DIFFREF=BR:IS-PS{6A:CXW1}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:IS-PS{6A:CXW1}I-I, CH_REF=BR:IS-PS{6A:CXW1}I-I_Ref, CH_TOL=BR:IS-PS{6A:CXW1}I_I_Tol-SP, CH_ARCH=BR:IS-PS{6A:CXW1}I_I_Arch-I, CH_DIFFREF=BR:IS-PS{6A:CXW1}I_I_DiffRef-I, CH_DIFFARCH=BR:IS-PS{6A:CXW1}I_I_DiffArch-I, CH_FLG=BR:IS-PS{6A:CXW1}I_I_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{6A:CXW1}I_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{6A:CXW1}I-I, CH_REF=BR:IS-PS{6A:CXW1}I-I_Ref, CH_DIFFREF=BR:IS-PS{6A:CXW1}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{6A:CXW1}I-I, CH_REF=BR:IS-PS{6A:CXW1}I-SP-1k, CH_DIFFREF=BR:IS-PS{6A:CXW1}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:IS-PS{6A:CXW1}I:DAC-I, CH_REF=BR:IS-PS{6A:CXW1}I:DAC-I_Ref, CH_TOL=BR:IS-PS{6A:CXW1}I:DAC_I_Tol-SP,  CH_ARCH=BR:IS-PS{6A:CXW1}I:DAC_I_Arch-I, CH_DIFFREF=BR:IS-PS{6A:CXW1}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR:IS-PS{6A:CXW1}I:DAC_I_DiffArch-I, CH_FLG=BR:IS-PS{6A:CXW1}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{6A:CXW1}I:DAC_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{6A:CXW1}I:DAC-I, CH_REF=BR:IS-PS{6A:CXW1}I:DAC-I_Ref, CH_DIFFREF=BR:IS-PS{6A:CXW1}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{6A:CXW1}I:DAC-I, CH_REF=BR:IS-PS{6A:CXW1}I-SP-1k, CH_DIFFREF=BR:IS-PS{6A:CXW1}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:IS-PS{6A:CXW1}E:PS-I, CH_REF=BR:IS-PS{6A:CXW1}E:PS-I_Ref, CH_TOL=BR:IS-PS{6A:CXW1}E:PS_I_Tol-SP, CH_ARCH=BR:IS-PS{6A:CXW1}E:PS_I_Arch-I, CH_DIFFREF=BR:IS-PS{6A:CXW1}E:PS_I_DiffRef-I, CH_DIFFARCH=BR:IS-PS{6A:CXW1}E:PS_I_DiffArch-I, CH_FLG=BR:IS-PS{6A:CXW1}E:PS_I_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{6A:CXW1}E:PS_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{6A:CXW1}E:PS-I, CH_REF=BR:IS-PS{6A:CXW1}E:PS-I_Ref, CH_DIFFREF=BR:IS-PS{6A:CXW1}E:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{6A:CXW1}Cmd:PwrOn-Cmd, CH_REF=BR:IS-PS{6A:CXW1}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:IS-PS{6A:CXW1}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:IS-PS{6A:CXW1}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{6A:CXW1}Cmd:PwrOn_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{6A:CXW1}Cmd:PwrOn-Cmd, CH_REF=BR:IS-PS{6A:CXW1}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:IS-PS{6A:CXW1}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{6A:CXW1}Sts:PSworks-Sts, CH_REF=BR:IS-PS{6A:CXW1}Sts:PSworks-Sts_Ref, CH_ARCH=BR:IS-PS{6A:CXW1}Sts:PSworks_Arch-Sts, CH_FLG=BR:IS-PS{6A:CXW1}Sts:PSworks_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{6A:CXW1}Sts:PSworks_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{6A:CXW1}Sts:PSworks-Sts, CH_REF=BR:IS-PS{6A:CXW1}Sts:PSworks-Sts_Ref, CH_FLG=BR:IS-PS{6A:CXW1}Sts:PSworks_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")


# PSC40 Chan 1
# BR:A4-PS{6A:SF1} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:A4-PS{6A:SF1}I-SP,              OUTPUT=BR{PSC40}DAC:1-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC40}ADC:08-I,    OUTPUT=BR:A4-PS{6A:SF1}I-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC40}ADC:09-I,    OUTPUT=BR:A4-PS{6A:SF1}I:DAC-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC40}ADC:10-I,    OUTPUT=BR:A4-PS{6A:SF1}E:PS-I,      WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:A4-PS{6A:SF1}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC40}DO:0-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC40}DI:00-Sts,   OUTPUT=BR:A4-PS{6A:SF1}Sts:PSworks-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:A4-PS{6A:SF1}I-SP, OUTPUT=BR:A4-PS{6A:SF1}I-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:A4-PS{6A:SF1}I-SP-1k, OUTPUT=BR:A4-PS{6A:SF1}I-SP-1k-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A4-PS{6A:SF1}I-SP-1k, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A4-PS{6A:SF1}I-I,     OUTPUT=BR:A4-PS{6A:SF1}I-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A4-PS{6A:SF1}I-I,     WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A4-PS{6A:SF1}I:DAC-I, OUTPUT=BR:A4-PS{6A:SF1}I:DAC-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A4-PS{6A:SF1}I:DAC-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A4-PS{6A:SF1}E:PS-I,  OUTPUT=BR:A4-PS{6A:SF1}E:PS-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A4-PS{6A:SF1}E:PS-I,  WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A4-PS{6A:SF1}I-SP, CH_REF=BR:A4-PS{6A:SF1}I-SP_Ref, CH_TOL=BR:A4-PS{6A:SF1}I_SP_Tol-SP, CH_ARCH=BR:A4-PS{6A:SF1}I_SP_Arch-I, CH_DIFFREF=BR:A4-PS{6A:SF1}I_SP_DiffRef-I, CH_DIFFARCH=BR:A4-PS{6A:SF1}I_SP_DiffArch-I, CH_FLG=BR:A4-PS{6A:SF1}I_SP_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:SF1}I_SP_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:SF1}I-SP, CH_REF=BR:A4-PS{6A:SF1}I-SP_Ref, CH_DIFFREF=BR:A4-PS{6A:SF1}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A4-PS{6A:SF1}I-I, CH_REF=BR:A4-PS{6A:SF1}I-I_Ref, CH_TOL=BR:A4-PS{6A:SF1}I_I_Tol-SP, CH_ARCH=BR:A4-PS{6A:SF1}I_I_Arch-I, CH_DIFFREF=BR:A4-PS{6A:SF1}I_I_DiffRef-I, CH_DIFFARCH=BR:A4-PS{6A:SF1}I_I_DiffArch-I, CH_FLG=BR:A4-PS{6A:SF1}I_I_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:SF1}I_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:SF1}I-I, CH_REF=BR:A4-PS{6A:SF1}I-I_Ref, CH_DIFFREF=BR:A4-PS{6A:SF1}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:SF1}I-I, CH_REF=BR:A4-PS{6A:SF1}I-SP-1k, CH_DIFFREF=BR:A4-PS{6A:SF1}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A4-PS{6A:SF1}I:DAC-I, CH_REF=BR:A4-PS{6A:SF1}I:DAC-I_Ref, CH_TOL=BR:A4-PS{6A:SF1}I:DAC_I_Tol-SP,  CH_ARCH=BR:A4-PS{6A:SF1}I:DAC_I_Arch-I, CH_DIFFREF=BR:A4-PS{6A:SF1}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR:A4-PS{6A:SF1}I:DAC_I_DiffArch-I, CH_FLG=BR:A4-PS{6A:SF1}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:SF1}I:DAC_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:SF1}I:DAC-I, CH_REF=BR:A4-PS{6A:SF1}I:DAC-I_Ref, CH_DIFFREF=BR:A4-PS{6A:SF1}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:SF1}I:DAC-I, CH_REF=BR:A4-PS{6A:SF1}I-SP-1k, CH_DIFFREF=BR:A4-PS{6A:SF1}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A4-PS{6A:SF1}E:PS-I, CH_REF=BR:A4-PS{6A:SF1}E:PS-I_Ref, CH_TOL=BR:A4-PS{6A:SF1}E:PS_I_Tol-SP, CH_ARCH=BR:A4-PS{6A:SF1}E:PS_I_Arch-I, CH_DIFFREF=BR:A4-PS{6A:SF1}E:PS_I_DiffRef-I, CH_DIFFARCH=BR:A4-PS{6A:SF1}E:PS_I_DiffArch-I, CH_FLG=BR:A4-PS{6A:SF1}E:PS_I_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:SF1}E:PS_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:SF1}E:PS-I, CH_REF=BR:A4-PS{6A:SF1}E:PS-I_Ref, CH_DIFFREF=BR:A4-PS{6A:SF1}E:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A4-PS{6A:SF1}Cmd:PwrOn-Cmd, CH_REF=BR:A4-PS{6A:SF1}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:A4-PS{6A:SF1}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:A4-PS{6A:SF1}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:SF1}Cmd:PwrOn_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A4-PS{6A:SF1}Cmd:PwrOn-Cmd, CH_REF=BR:A4-PS{6A:SF1}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:A4-PS{6A:SF1}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A4-PS{6A:SF1}Sts:PSworks-Sts, CH_REF=BR:A4-PS{6A:SF1}Sts:PSworks-Sts_Ref, CH_ARCH=BR:A4-PS{6A:SF1}Sts:PSworks_Arch-Sts, CH_FLG=BR:A4-PS{6A:SF1}Sts:PSworks_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:SF1}Sts:PSworks_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A4-PS{6A:SF1}Sts:PSworks-Sts, CH_REF=BR:A4-PS{6A:SF1}Sts:PSworks-Sts_Ref, CH_FLG=BR:A4-PS{6A:SF1}Sts:PSworks_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")


# PSC41 Chan 0
# BR:A4-PS{6A:CY1} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:A4-PS{6A:CY1}I-SP,              OUTPUT=BR{PSC41}DAC:0-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC41}ADC:00-I,    OUTPUT=BR:A4-PS{6A:CY1}I-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC41}ADC:01-I,    OUTPUT=BR:A4-PS{6A:CY1}I:DAC-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC41}ADC:02-I,    OUTPUT=BR:A4-PS{6A:CY1}E:PS-I,      WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:A4-PS{6A:CY1}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC41}DO:1-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC41}DI:01-Sts,   OUTPUT=BR:A4-PS{6A:CY1}Sts:PSworks-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:A4-PS{6A:CY1}I-SP, OUTPUT=BR:A4-PS{6A:CY1}I-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:A4-PS{6A:CY1}I-SP-1k, OUTPUT=BR:A4-PS{6A:CY1}I-SP-1k-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A4-PS{6A:CY1}I-SP-1k, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A4-PS{6A:CY1}I-I,     OUTPUT=BR:A4-PS{6A:CY1}I-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A4-PS{6A:CY1}I-I,     WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A4-PS{6A:CY1}I:DAC-I, OUTPUT=BR:A4-PS{6A:CY1}I:DAC-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A4-PS{6A:CY1}I:DAC-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A4-PS{6A:CY1}E:PS-I,  OUTPUT=BR:A4-PS{6A:CY1}E:PS-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A4-PS{6A:CY1}E:PS-I,  WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A4-PS{6A:CY1}I-SP, CH_REF=BR:A4-PS{6A:CY1}I-SP_Ref, CH_TOL=BR:A4-PS{6A:CY1}I_SP_Tol-SP, CH_ARCH=BR:A4-PS{6A:CY1}I_SP_Arch-I, CH_DIFFREF=BR:A4-PS{6A:CY1}I_SP_DiffRef-I, CH_DIFFARCH=BR:A4-PS{6A:CY1}I_SP_DiffArch-I, CH_FLG=BR:A4-PS{6A:CY1}I_SP_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:CY1}I_SP_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:CY1}I-SP, CH_REF=BR:A4-PS{6A:CY1}I-SP_Ref, CH_DIFFREF=BR:A4-PS{6A:CY1}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A4-PS{6A:CY1}I-I, CH_REF=BR:A4-PS{6A:CY1}I-I_Ref, CH_TOL=BR:A4-PS{6A:CY1}I_I_Tol-SP, CH_ARCH=BR:A4-PS{6A:CY1}I_I_Arch-I, CH_DIFFREF=BR:A4-PS{6A:CY1}I_I_DiffRef-I, CH_DIFFARCH=BR:A4-PS{6A:CY1}I_I_DiffArch-I, CH_FLG=BR:A4-PS{6A:CY1}I_I_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:CY1}I_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:CY1}I-I, CH_REF=BR:A4-PS{6A:CY1}I-I_Ref, CH_DIFFREF=BR:A4-PS{6A:CY1}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:CY1}I-I, CH_REF=BR:A4-PS{6A:CY1}I-SP-1k, CH_DIFFREF=BR:A4-PS{6A:CY1}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A4-PS{6A:CY1}I:DAC-I, CH_REF=BR:A4-PS{6A:CY1}I:DAC-I_Ref, CH_TOL=BR:A4-PS{6A:CY1}I:DAC_I_Tol-SP,  CH_ARCH=BR:A4-PS{6A:CY1}I:DAC_I_Arch-I, CH_DIFFREF=BR:A4-PS{6A:CY1}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR:A4-PS{6A:CY1}I:DAC_I_DiffArch-I, CH_FLG=BR:A4-PS{6A:CY1}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:CY1}I:DAC_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:CY1}I:DAC-I, CH_REF=BR:A4-PS{6A:CY1}I:DAC-I_Ref, CH_DIFFREF=BR:A4-PS{6A:CY1}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:CY1}I:DAC-I, CH_REF=BR:A4-PS{6A:CY1}I-SP-1k, CH_DIFFREF=BR:A4-PS{6A:CY1}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A4-PS{6A:CY1}E:PS-I, CH_REF=BR:A4-PS{6A:CY1}E:PS-I_Ref, CH_TOL=BR:A4-PS{6A:CY1}E:PS_I_Tol-SP, CH_ARCH=BR:A4-PS{6A:CY1}E:PS_I_Arch-I, CH_DIFFREF=BR:A4-PS{6A:CY1}E:PS_I_DiffRef-I, CH_DIFFARCH=BR:A4-PS{6A:CY1}E:PS_I_DiffArch-I, CH_FLG=BR:A4-PS{6A:CY1}E:PS_I_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:CY1}E:PS_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:CY1}E:PS-I, CH_REF=BR:A4-PS{6A:CY1}E:PS-I_Ref, CH_DIFFREF=BR:A4-PS{6A:CY1}E:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A4-PS{6A:CY1}Cmd:PwrOn-Cmd, CH_REF=BR:A4-PS{6A:CY1}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:A4-PS{6A:CY1}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:A4-PS{6A:CY1}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:CY1}Cmd:PwrOn_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A4-PS{6A:CY1}Cmd:PwrOn-Cmd, CH_REF=BR:A4-PS{6A:CY1}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:A4-PS{6A:CY1}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A4-PS{6A:CY1}Sts:PSworks-Sts, CH_REF=BR:A4-PS{6A:CY1}Sts:PSworks-Sts_Ref, CH_ARCH=BR:A4-PS{6A:CY1}Sts:PSworks_Arch-Sts, CH_FLG=BR:A4-PS{6A:CY1}Sts:PSworks_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:CY1}Sts:PSworks_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A4-PS{6A:CY1}Sts:PSworks-Sts, CH_REF=BR:A4-PS{6A:CY1}Sts:PSworks-Sts_Ref, CH_FLG=BR:A4-PS{6A:CY1}Sts:PSworks_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")


# PSC41 Chan 1
# BR:A4-PS{6A:CY2} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:A4-PS{6A:CY2}I-SP,              OUTPUT=BR{PSC41}DAC:1-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC41}ADC:08-I,    OUTPUT=BR:A4-PS{6A:CY2}I-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC41}ADC:09-I,    OUTPUT=BR:A4-PS{6A:CY2}I:DAC-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC41}ADC:10-I,    OUTPUT=BR:A4-PS{6A:CY2}E:PS-I,      WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:A4-PS{6A:CY2}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC41}DO:0-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC41}DI:00-Sts,   OUTPUT=BR:A4-PS{6A:CY2}Sts:PSworks-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:A4-PS{6A:CY2}I-SP, OUTPUT=BR:A4-PS{6A:CY2}I-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:A4-PS{6A:CY2}I-SP-1k, OUTPUT=BR:A4-PS{6A:CY2}I-SP-1k-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A4-PS{6A:CY2}I-SP-1k, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A4-PS{6A:CY2}I-I,     OUTPUT=BR:A4-PS{6A:CY2}I-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A4-PS{6A:CY2}I-I,     WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A4-PS{6A:CY2}I:DAC-I, OUTPUT=BR:A4-PS{6A:CY2}I:DAC-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A4-PS{6A:CY2}I:DAC-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A4-PS{6A:CY2}E:PS-I,  OUTPUT=BR:A4-PS{6A:CY2}E:PS-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A4-PS{6A:CY2}E:PS-I,  WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A4-PS{6A:CY2}I-SP, CH_REF=BR:A4-PS{6A:CY2}I-SP_Ref, CH_TOL=BR:A4-PS{6A:CY2}I_SP_Tol-SP, CH_ARCH=BR:A4-PS{6A:CY2}I_SP_Arch-I, CH_DIFFREF=BR:A4-PS{6A:CY2}I_SP_DiffRef-I, CH_DIFFARCH=BR:A4-PS{6A:CY2}I_SP_DiffArch-I, CH_FLG=BR:A4-PS{6A:CY2}I_SP_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:CY2}I_SP_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:CY2}I-SP, CH_REF=BR:A4-PS{6A:CY2}I-SP_Ref, CH_DIFFREF=BR:A4-PS{6A:CY2}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A4-PS{6A:CY2}I-I, CH_REF=BR:A4-PS{6A:CY2}I-I_Ref, CH_TOL=BR:A4-PS{6A:CY2}I_I_Tol-SP, CH_ARCH=BR:A4-PS{6A:CY2}I_I_Arch-I, CH_DIFFREF=BR:A4-PS{6A:CY2}I_I_DiffRef-I, CH_DIFFARCH=BR:A4-PS{6A:CY2}I_I_DiffArch-I, CH_FLG=BR:A4-PS{6A:CY2}I_I_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:CY2}I_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:CY2}I-I, CH_REF=BR:A4-PS{6A:CY2}I-I_Ref, CH_DIFFREF=BR:A4-PS{6A:CY2}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:CY2}I-I, CH_REF=BR:A4-PS{6A:CY2}I-SP-1k, CH_DIFFREF=BR:A4-PS{6A:CY2}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A4-PS{6A:CY2}I:DAC-I, CH_REF=BR:A4-PS{6A:CY2}I:DAC-I_Ref, CH_TOL=BR:A4-PS{6A:CY2}I:DAC_I_Tol-SP,  CH_ARCH=BR:A4-PS{6A:CY2}I:DAC_I_Arch-I, CH_DIFFREF=BR:A4-PS{6A:CY2}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR:A4-PS{6A:CY2}I:DAC_I_DiffArch-I, CH_FLG=BR:A4-PS{6A:CY2}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:CY2}I:DAC_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:CY2}I:DAC-I, CH_REF=BR:A4-PS{6A:CY2}I:DAC-I_Ref, CH_DIFFREF=BR:A4-PS{6A:CY2}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:CY2}I:DAC-I, CH_REF=BR:A4-PS{6A:CY2}I-SP-1k, CH_DIFFREF=BR:A4-PS{6A:CY2}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A4-PS{6A:CY2}E:PS-I, CH_REF=BR:A4-PS{6A:CY2}E:PS-I_Ref, CH_TOL=BR:A4-PS{6A:CY2}E:PS_I_Tol-SP, CH_ARCH=BR:A4-PS{6A:CY2}E:PS_I_Arch-I, CH_DIFFREF=BR:A4-PS{6A:CY2}E:PS_I_DiffRef-I, CH_DIFFARCH=BR:A4-PS{6A:CY2}E:PS_I_DiffArch-I, CH_FLG=BR:A4-PS{6A:CY2}E:PS_I_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:CY2}E:PS_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:CY2}E:PS-I, CH_REF=BR:A4-PS{6A:CY2}E:PS-I_Ref, CH_DIFFREF=BR:A4-PS{6A:CY2}E:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A4-PS{6A:CY2}Cmd:PwrOn-Cmd, CH_REF=BR:A4-PS{6A:CY2}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:A4-PS{6A:CY2}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:A4-PS{6A:CY2}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:CY2}Cmd:PwrOn_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A4-PS{6A:CY2}Cmd:PwrOn-Cmd, CH_REF=BR:A4-PS{6A:CY2}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:A4-PS{6A:CY2}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A4-PS{6A:CY2}Sts:PSworks-Sts, CH_REF=BR:A4-PS{6A:CY2}Sts:PSworks-Sts_Ref, CH_ARCH=BR:A4-PS{6A:CY2}Sts:PSworks_Arch-Sts, CH_FLG=BR:A4-PS{6A:CY2}Sts:PSworks_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:CY2}Sts:PSworks_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A4-PS{6A:CY2}Sts:PSworks-Sts, CH_REF=BR:A4-PS{6A:CY2}Sts:PSworks-Sts_Ref, CH_FLG=BR:A4-PS{6A:CY2}Sts:PSworks_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")


# PSC42 Chan 0
# BR:A4-PS{6A:CY3} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:A4-PS{6A:CY3}I-SP,              OUTPUT=BR{PSC42}DAC:0-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC42}ADC:00-I,    OUTPUT=BR:A4-PS{6A:CY3}I-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC42}ADC:01-I,    OUTPUT=BR:A4-PS{6A:CY3}I:DAC-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC42}ADC:02-I,    OUTPUT=BR:A4-PS{6A:CY3}E:PS-I,      WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:A4-PS{6A:CY3}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC42}DO:1-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC42}DI:01-Sts,   OUTPUT=BR:A4-PS{6A:CY3}Sts:PSworks-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:A4-PS{6A:CY3}I-SP, OUTPUT=BR:A4-PS{6A:CY3}I-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:A4-PS{6A:CY3}I-SP-1k, OUTPUT=BR:A4-PS{6A:CY3}I-SP-1k-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A4-PS{6A:CY3}I-SP-1k, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A4-PS{6A:CY3}I-I,     OUTPUT=BR:A4-PS{6A:CY3}I-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A4-PS{6A:CY3}I-I,     WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A4-PS{6A:CY3}I:DAC-I, OUTPUT=BR:A4-PS{6A:CY3}I:DAC-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A4-PS{6A:CY3}I:DAC-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A4-PS{6A:CY3}E:PS-I,  OUTPUT=BR:A4-PS{6A:CY3}E:PS-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A4-PS{6A:CY3}E:PS-I,  WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A4-PS{6A:CY3}I-SP, CH_REF=BR:A4-PS{6A:CY3}I-SP_Ref, CH_TOL=BR:A4-PS{6A:CY3}I_SP_Tol-SP, CH_ARCH=BR:A4-PS{6A:CY3}I_SP_Arch-I, CH_DIFFREF=BR:A4-PS{6A:CY3}I_SP_DiffRef-I, CH_DIFFARCH=BR:A4-PS{6A:CY3}I_SP_DiffArch-I, CH_FLG=BR:A4-PS{6A:CY3}I_SP_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:CY3}I_SP_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:CY3}I-SP, CH_REF=BR:A4-PS{6A:CY3}I-SP_Ref, CH_DIFFREF=BR:A4-PS{6A:CY3}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A4-PS{6A:CY3}I-I, CH_REF=BR:A4-PS{6A:CY3}I-I_Ref, CH_TOL=BR:A4-PS{6A:CY3}I_I_Tol-SP, CH_ARCH=BR:A4-PS{6A:CY3}I_I_Arch-I, CH_DIFFREF=BR:A4-PS{6A:CY3}I_I_DiffRef-I, CH_DIFFARCH=BR:A4-PS{6A:CY3}I_I_DiffArch-I, CH_FLG=BR:A4-PS{6A:CY3}I_I_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:CY3}I_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:CY3}I-I, CH_REF=BR:A4-PS{6A:CY3}I-I_Ref, CH_DIFFREF=BR:A4-PS{6A:CY3}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:CY3}I-I, CH_REF=BR:A4-PS{6A:CY3}I-SP-1k, CH_DIFFREF=BR:A4-PS{6A:CY3}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A4-PS{6A:CY3}I:DAC-I, CH_REF=BR:A4-PS{6A:CY3}I:DAC-I_Ref, CH_TOL=BR:A4-PS{6A:CY3}I:DAC_I_Tol-SP,  CH_ARCH=BR:A4-PS{6A:CY3}I:DAC_I_Arch-I, CH_DIFFREF=BR:A4-PS{6A:CY3}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR:A4-PS{6A:CY3}I:DAC_I_DiffArch-I, CH_FLG=BR:A4-PS{6A:CY3}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:CY3}I:DAC_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:CY3}I:DAC-I, CH_REF=BR:A4-PS{6A:CY3}I:DAC-I_Ref, CH_DIFFREF=BR:A4-PS{6A:CY3}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:CY3}I:DAC-I, CH_REF=BR:A4-PS{6A:CY3}I-SP-1k, CH_DIFFREF=BR:A4-PS{6A:CY3}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A4-PS{6A:CY3}E:PS-I, CH_REF=BR:A4-PS{6A:CY3}E:PS-I_Ref, CH_TOL=BR:A4-PS{6A:CY3}E:PS_I_Tol-SP, CH_ARCH=BR:A4-PS{6A:CY3}E:PS_I_Arch-I, CH_DIFFREF=BR:A4-PS{6A:CY3}E:PS_I_DiffRef-I, CH_DIFFARCH=BR:A4-PS{6A:CY3}E:PS_I_DiffArch-I, CH_FLG=BR:A4-PS{6A:CY3}E:PS_I_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:CY3}E:PS_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:CY3}E:PS-I, CH_REF=BR:A4-PS{6A:CY3}E:PS-I_Ref, CH_DIFFREF=BR:A4-PS{6A:CY3}E:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A4-PS{6A:CY3}Cmd:PwrOn-Cmd, CH_REF=BR:A4-PS{6A:CY3}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:A4-PS{6A:CY3}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:A4-PS{6A:CY3}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:CY3}Cmd:PwrOn_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A4-PS{6A:CY3}Cmd:PwrOn-Cmd, CH_REF=BR:A4-PS{6A:CY3}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:A4-PS{6A:CY3}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A4-PS{6A:CY3}Sts:PSworks-Sts, CH_REF=BR:A4-PS{6A:CY3}Sts:PSworks-Sts_Ref, CH_ARCH=BR:A4-PS{6A:CY3}Sts:PSworks_Arch-Sts, CH_FLG=BR:A4-PS{6A:CY3}Sts:PSworks_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:CY3}Sts:PSworks_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A4-PS{6A:CY3}Sts:PSworks-Sts, CH_REF=BR:A4-PS{6A:CY3}Sts:PSworks-Sts_Ref, CH_FLG=BR:A4-PS{6A:CY3}Sts:PSworks_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")


# PSC42 Chan 1
# BR:A4-PS{6A:CY4} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:A4-PS{6A:CY4}I-SP,              OUTPUT=BR{PSC42}DAC:1-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC42}ADC:08-I,    OUTPUT=BR:A4-PS{6A:CY4}I-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC42}ADC:09-I,    OUTPUT=BR:A4-PS{6A:CY4}I:DAC-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC42}ADC:10-I,    OUTPUT=BR:A4-PS{6A:CY4}E:PS-I,      WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:A4-PS{6A:CY4}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC42}DO:0-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC42}DI:00-Sts,   OUTPUT=BR:A4-PS{6A:CY4}Sts:PSworks-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:A4-PS{6A:CY4}I-SP, OUTPUT=BR:A4-PS{6A:CY4}I-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:A4-PS{6A:CY4}I-SP-1k, OUTPUT=BR:A4-PS{6A:CY4}I-SP-1k-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A4-PS{6A:CY4}I-SP-1k, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A4-PS{6A:CY4}I-I,     OUTPUT=BR:A4-PS{6A:CY4}I-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A4-PS{6A:CY4}I-I,     WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A4-PS{6A:CY4}I:DAC-I, OUTPUT=BR:A4-PS{6A:CY4}I:DAC-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A4-PS{6A:CY4}I:DAC-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A4-PS{6A:CY4}E:PS-I,  OUTPUT=BR:A4-PS{6A:CY4}E:PS-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A4-PS{6A:CY4}E:PS-I,  WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A4-PS{6A:CY4}I-SP, CH_REF=BR:A4-PS{6A:CY4}I-SP_Ref, CH_TOL=BR:A4-PS{6A:CY4}I_SP_Tol-SP, CH_ARCH=BR:A4-PS{6A:CY4}I_SP_Arch-I, CH_DIFFREF=BR:A4-PS{6A:CY4}I_SP_DiffRef-I, CH_DIFFARCH=BR:A4-PS{6A:CY4}I_SP_DiffArch-I, CH_FLG=BR:A4-PS{6A:CY4}I_SP_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:CY4}I_SP_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:CY4}I-SP, CH_REF=BR:A4-PS{6A:CY4}I-SP_Ref, CH_DIFFREF=BR:A4-PS{6A:CY4}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A4-PS{6A:CY4}I-I, CH_REF=BR:A4-PS{6A:CY4}I-I_Ref, CH_TOL=BR:A4-PS{6A:CY4}I_I_Tol-SP, CH_ARCH=BR:A4-PS{6A:CY4}I_I_Arch-I, CH_DIFFREF=BR:A4-PS{6A:CY4}I_I_DiffRef-I, CH_DIFFARCH=BR:A4-PS{6A:CY4}I_I_DiffArch-I, CH_FLG=BR:A4-PS{6A:CY4}I_I_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:CY4}I_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:CY4}I-I, CH_REF=BR:A4-PS{6A:CY4}I-I_Ref, CH_DIFFREF=BR:A4-PS{6A:CY4}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:CY4}I-I, CH_REF=BR:A4-PS{6A:CY4}I-SP-1k, CH_DIFFREF=BR:A4-PS{6A:CY4}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A4-PS{6A:CY4}I:DAC-I, CH_REF=BR:A4-PS{6A:CY4}I:DAC-I_Ref, CH_TOL=BR:A4-PS{6A:CY4}I:DAC_I_Tol-SP,  CH_ARCH=BR:A4-PS{6A:CY4}I:DAC_I_Arch-I, CH_DIFFREF=BR:A4-PS{6A:CY4}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR:A4-PS{6A:CY4}I:DAC_I_DiffArch-I, CH_FLG=BR:A4-PS{6A:CY4}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:CY4}I:DAC_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:CY4}I:DAC-I, CH_REF=BR:A4-PS{6A:CY4}I:DAC-I_Ref, CH_DIFFREF=BR:A4-PS{6A:CY4}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:CY4}I:DAC-I, CH_REF=BR:A4-PS{6A:CY4}I-SP-1k, CH_DIFFREF=BR:A4-PS{6A:CY4}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A4-PS{6A:CY4}E:PS-I, CH_REF=BR:A4-PS{6A:CY4}E:PS-I_Ref, CH_TOL=BR:A4-PS{6A:CY4}E:PS_I_Tol-SP, CH_ARCH=BR:A4-PS{6A:CY4}E:PS_I_Arch-I, CH_DIFFREF=BR:A4-PS{6A:CY4}E:PS_I_DiffRef-I, CH_DIFFARCH=BR:A4-PS{6A:CY4}E:PS_I_DiffArch-I, CH_FLG=BR:A4-PS{6A:CY4}E:PS_I_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:CY4}E:PS_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:CY4}E:PS-I, CH_REF=BR:A4-PS{6A:CY4}E:PS-I_Ref, CH_DIFFREF=BR:A4-PS{6A:CY4}E:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A4-PS{6A:CY4}Cmd:PwrOn-Cmd, CH_REF=BR:A4-PS{6A:CY4}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:A4-PS{6A:CY4}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:A4-PS{6A:CY4}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:CY4}Cmd:PwrOn_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A4-PS{6A:CY4}Cmd:PwrOn-Cmd, CH_REF=BR:A4-PS{6A:CY4}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:A4-PS{6A:CY4}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A4-PS{6A:CY4}Sts:PSworks-Sts, CH_REF=BR:A4-PS{6A:CY4}Sts:PSworks-Sts_Ref, CH_ARCH=BR:A4-PS{6A:CY4}Sts:PSworks_Arch-Sts, CH_FLG=BR:A4-PS{6A:CY4}Sts:PSworks_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:CY4}Sts:PSworks_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A4-PS{6A:CY4}Sts:PSworks-Sts, CH_REF=BR:A4-PS{6A:CY4}Sts:PSworks-Sts_Ref, CH_FLG=BR:A4-PS{6A:CY4}Sts:PSworks_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")


# PSC43 Chan 0
# BR:A4-PS{6A:SD1} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:A4-PS{6A:SD1}I-SP,              OUTPUT=BR{PSC43}DAC:0-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC43}ADC:00-I,    OUTPUT=BR:A4-PS{6A:SD1}I-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC43}ADC:01-I,    OUTPUT=BR:A4-PS{6A:SD1}I:DAC-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC43}ADC:02-I,    OUTPUT=BR:A4-PS{6A:SD1}E:PS-I,      WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:A4-PS{6A:SD1}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC43}DO:1-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC43}DI:01-Sts,   OUTPUT=BR:A4-PS{6A:SD1}Sts:PSworks-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:A4-PS{6A:SD1}I-SP, OUTPUT=BR:A4-PS{6A:SD1}I-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:A4-PS{6A:SD1}I-SP-1k, OUTPUT=BR:A4-PS{6A:SD1}I-SP-1k-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A4-PS{6A:SD1}I-SP-1k, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A4-PS{6A:SD1}I-I,     OUTPUT=BR:A4-PS{6A:SD1}I-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A4-PS{6A:SD1}I-I,     WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A4-PS{6A:SD1}I:DAC-I, OUTPUT=BR:A4-PS{6A:SD1}I:DAC-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A4-PS{6A:SD1}I:DAC-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A4-PS{6A:SD1}E:PS-I,  OUTPUT=BR:A4-PS{6A:SD1}E:PS-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A4-PS{6A:SD1}E:PS-I,  WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A4-PS{6A:SD1}I-SP, CH_REF=BR:A4-PS{6A:SD1}I-SP_Ref, CH_TOL=BR:A4-PS{6A:SD1}I_SP_Tol-SP, CH_ARCH=BR:A4-PS{6A:SD1}I_SP_Arch-I, CH_DIFFREF=BR:A4-PS{6A:SD1}I_SP_DiffRef-I, CH_DIFFARCH=BR:A4-PS{6A:SD1}I_SP_DiffArch-I, CH_FLG=BR:A4-PS{6A:SD1}I_SP_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:SD1}I_SP_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:SD1}I-SP, CH_REF=BR:A4-PS{6A:SD1}I-SP_Ref, CH_DIFFREF=BR:A4-PS{6A:SD1}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A4-PS{6A:SD1}I-I, CH_REF=BR:A4-PS{6A:SD1}I-I_Ref, CH_TOL=BR:A4-PS{6A:SD1}I_I_Tol-SP, CH_ARCH=BR:A4-PS{6A:SD1}I_I_Arch-I, CH_DIFFREF=BR:A4-PS{6A:SD1}I_I_DiffRef-I, CH_DIFFARCH=BR:A4-PS{6A:SD1}I_I_DiffArch-I, CH_FLG=BR:A4-PS{6A:SD1}I_I_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:SD1}I_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:SD1}I-I, CH_REF=BR:A4-PS{6A:SD1}I-I_Ref, CH_DIFFREF=BR:A4-PS{6A:SD1}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:SD1}I-I, CH_REF=BR:A4-PS{6A:SD1}I-SP-1k, CH_DIFFREF=BR:A4-PS{6A:SD1}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A4-PS{6A:SD1}I:DAC-I, CH_REF=BR:A4-PS{6A:SD1}I:DAC-I_Ref, CH_TOL=BR:A4-PS{6A:SD1}I:DAC_I_Tol-SP,  CH_ARCH=BR:A4-PS{6A:SD1}I:DAC_I_Arch-I, CH_DIFFREF=BR:A4-PS{6A:SD1}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR:A4-PS{6A:SD1}I:DAC_I_DiffArch-I, CH_FLG=BR:A4-PS{6A:SD1}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:SD1}I:DAC_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:SD1}I:DAC-I, CH_REF=BR:A4-PS{6A:SD1}I:DAC-I_Ref, CH_DIFFREF=BR:A4-PS{6A:SD1}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:SD1}I:DAC-I, CH_REF=BR:A4-PS{6A:SD1}I-SP-1k, CH_DIFFREF=BR:A4-PS{6A:SD1}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A4-PS{6A:SD1}E:PS-I, CH_REF=BR:A4-PS{6A:SD1}E:PS-I_Ref, CH_TOL=BR:A4-PS{6A:SD1}E:PS_I_Tol-SP, CH_ARCH=BR:A4-PS{6A:SD1}E:PS_I_Arch-I, CH_DIFFREF=BR:A4-PS{6A:SD1}E:PS_I_DiffRef-I, CH_DIFFARCH=BR:A4-PS{6A:SD1}E:PS_I_DiffArch-I, CH_FLG=BR:A4-PS{6A:SD1}E:PS_I_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:SD1}E:PS_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:SD1}E:PS-I, CH_REF=BR:A4-PS{6A:SD1}E:PS-I_Ref, CH_DIFFREF=BR:A4-PS{6A:SD1}E:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A4-PS{6A:SD1}Cmd:PwrOn-Cmd, CH_REF=BR:A4-PS{6A:SD1}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:A4-PS{6A:SD1}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:A4-PS{6A:SD1}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:SD1}Cmd:PwrOn_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A4-PS{6A:SD1}Cmd:PwrOn-Cmd, CH_REF=BR:A4-PS{6A:SD1}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:A4-PS{6A:SD1}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A4-PS{6A:SD1}Sts:PSworks-Sts, CH_REF=BR:A4-PS{6A:SD1}Sts:PSworks-Sts_Ref, CH_ARCH=BR:A4-PS{6A:SD1}Sts:PSworks_Arch-Sts, CH_FLG=BR:A4-PS{6A:SD1}Sts:PSworks_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:SD1}Sts:PSworks_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A4-PS{6A:SD1}Sts:PSworks-Sts, CH_REF=BR:A4-PS{6A:SD1}Sts:PSworks-Sts_Ref, CH_FLG=BR:A4-PS{6A:SD1}Sts:PSworks_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")


# PSC43 Chan 1
# BR:A4-PS{6A:SD2} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:A4-PS{6A:SD2}I-SP,              OUTPUT=BR{PSC43}DAC:1-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC43}ADC:08-I,    OUTPUT=BR:A4-PS{6A:SD2}I-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC43}ADC:09-I,    OUTPUT=BR:A4-PS{6A:SD2}I:DAC-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC43}ADC:10-I,    OUTPUT=BR:A4-PS{6A:SD2}E:PS-I,      WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:A4-PS{6A:SD2}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC43}DO:0-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC43}DI:00-Sts,   OUTPUT=BR:A4-PS{6A:SD2}Sts:PSworks-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:A4-PS{6A:SD2}I-SP, OUTPUT=BR:A4-PS{6A:SD2}I-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:A4-PS{6A:SD2}I-SP-1k, OUTPUT=BR:A4-PS{6A:SD2}I-SP-1k-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A4-PS{6A:SD2}I-SP-1k, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A4-PS{6A:SD2}I-I,     OUTPUT=BR:A4-PS{6A:SD2}I-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A4-PS{6A:SD2}I-I,     WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A4-PS{6A:SD2}I:DAC-I, OUTPUT=BR:A4-PS{6A:SD2}I:DAC-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A4-PS{6A:SD2}I:DAC-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A4-PS{6A:SD2}E:PS-I,  OUTPUT=BR:A4-PS{6A:SD2}E:PS-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A4-PS{6A:SD2}E:PS-I,  WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A4-PS{6A:SD2}I-SP, CH_REF=BR:A4-PS{6A:SD2}I-SP_Ref, CH_TOL=BR:A4-PS{6A:SD2}I_SP_Tol-SP, CH_ARCH=BR:A4-PS{6A:SD2}I_SP_Arch-I, CH_DIFFREF=BR:A4-PS{6A:SD2}I_SP_DiffRef-I, CH_DIFFARCH=BR:A4-PS{6A:SD2}I_SP_DiffArch-I, CH_FLG=BR:A4-PS{6A:SD2}I_SP_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:SD2}I_SP_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:SD2}I-SP, CH_REF=BR:A4-PS{6A:SD2}I-SP_Ref, CH_DIFFREF=BR:A4-PS{6A:SD2}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A4-PS{6A:SD2}I-I, CH_REF=BR:A4-PS{6A:SD2}I-I_Ref, CH_TOL=BR:A4-PS{6A:SD2}I_I_Tol-SP, CH_ARCH=BR:A4-PS{6A:SD2}I_I_Arch-I, CH_DIFFREF=BR:A4-PS{6A:SD2}I_I_DiffRef-I, CH_DIFFARCH=BR:A4-PS{6A:SD2}I_I_DiffArch-I, CH_FLG=BR:A4-PS{6A:SD2}I_I_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:SD2}I_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:SD2}I-I, CH_REF=BR:A4-PS{6A:SD2}I-I_Ref, CH_DIFFREF=BR:A4-PS{6A:SD2}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:SD2}I-I, CH_REF=BR:A4-PS{6A:SD2}I-SP-1k, CH_DIFFREF=BR:A4-PS{6A:SD2}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A4-PS{6A:SD2}I:DAC-I, CH_REF=BR:A4-PS{6A:SD2}I:DAC-I_Ref, CH_TOL=BR:A4-PS{6A:SD2}I:DAC_I_Tol-SP,  CH_ARCH=BR:A4-PS{6A:SD2}I:DAC_I_Arch-I, CH_DIFFREF=BR:A4-PS{6A:SD2}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR:A4-PS{6A:SD2}I:DAC_I_DiffArch-I, CH_FLG=BR:A4-PS{6A:SD2}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:SD2}I:DAC_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:SD2}I:DAC-I, CH_REF=BR:A4-PS{6A:SD2}I:DAC-I_Ref, CH_DIFFREF=BR:A4-PS{6A:SD2}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:SD2}I:DAC-I, CH_REF=BR:A4-PS{6A:SD2}I-SP-1k, CH_DIFFREF=BR:A4-PS{6A:SD2}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A4-PS{6A:SD2}E:PS-I, CH_REF=BR:A4-PS{6A:SD2}E:PS-I_Ref, CH_TOL=BR:A4-PS{6A:SD2}E:PS_I_Tol-SP, CH_ARCH=BR:A4-PS{6A:SD2}E:PS_I_Arch-I, CH_DIFFREF=BR:A4-PS{6A:SD2}E:PS_I_DiffRef-I, CH_DIFFARCH=BR:A4-PS{6A:SD2}E:PS_I_DiffArch-I, CH_FLG=BR:A4-PS{6A:SD2}E:PS_I_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:SD2}E:PS_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:SD2}E:PS-I, CH_REF=BR:A4-PS{6A:SD2}E:PS-I_Ref, CH_DIFFREF=BR:A4-PS{6A:SD2}E:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A4-PS{6A:SD2}Cmd:PwrOn-Cmd, CH_REF=BR:A4-PS{6A:SD2}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:A4-PS{6A:SD2}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:A4-PS{6A:SD2}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:SD2}Cmd:PwrOn_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A4-PS{6A:SD2}Cmd:PwrOn-Cmd, CH_REF=BR:A4-PS{6A:SD2}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:A4-PS{6A:SD2}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A4-PS{6A:SD2}Sts:PSworks-Sts, CH_REF=BR:A4-PS{6A:SD2}Sts:PSworks-Sts_Ref, CH_ARCH=BR:A4-PS{6A:SD2}Sts:PSworks_Arch-Sts, CH_FLG=BR:A4-PS{6A:SD2}Sts:PSworks_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:SD2}Sts:PSworks_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A4-PS{6A:SD2}Sts:PSworks-Sts, CH_REF=BR:A4-PS{6A:SD2}Sts:PSworks-Sts_Ref, CH_FLG=BR:A4-PS{6A:SD2}Sts:PSworks_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")


# PSC44 Chan 0
# BR:A4-PS{6A:SF2} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:A4-PS{6A:SF2}I-SP,              OUTPUT=BR{PSC44}DAC:0-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC44}ADC:00-I,    OUTPUT=BR:A4-PS{6A:SF2}I-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC44}ADC:01-I,    OUTPUT=BR:A4-PS{6A:SF2}I:DAC-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC44}ADC:02-I,    OUTPUT=BR:A4-PS{6A:SF2}E:PS-I,      WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:A4-PS{6A:SF2}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC44}DO:1-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC44}DI:01-Sts,   OUTPUT=BR:A4-PS{6A:SF2}Sts:PSworks-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:A4-PS{6A:SF2}I-SP, OUTPUT=BR:A4-PS{6A:SF2}I-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:A4-PS{6A:SF2}I-SP-1k, OUTPUT=BR:A4-PS{6A:SF2}I-SP-1k-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A4-PS{6A:SF2}I-SP-1k, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A4-PS{6A:SF2}I-I,     OUTPUT=BR:A4-PS{6A:SF2}I-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A4-PS{6A:SF2}I-I,     WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A4-PS{6A:SF2}I:DAC-I, OUTPUT=BR:A4-PS{6A:SF2}I:DAC-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A4-PS{6A:SF2}I:DAC-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:A4-PS{6A:SF2}E:PS-I,  OUTPUT=BR:A4-PS{6A:SF2}E:PS-I-Avg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer.db",         "INPUT=BR:A4-PS{6A:SF2}E:PS-I,  WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A4-PS{6A:SF2}I-SP, CH_REF=BR:A4-PS{6A:SF2}I-SP_Ref, CH_TOL=BR:A4-PS{6A:SF2}I_SP_Tol-SP, CH_ARCH=BR:A4-PS{6A:SF2}I_SP_Arch-I, CH_DIFFREF=BR:A4-PS{6A:SF2}I_SP_DiffRef-I, CH_DIFFARCH=BR:A4-PS{6A:SF2}I_SP_DiffArch-I, CH_FLG=BR:A4-PS{6A:SF2}I_SP_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:SF2}I_SP_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:SF2}I-SP, CH_REF=BR:A4-PS{6A:SF2}I-SP_Ref, CH_DIFFREF=BR:A4-PS{6A:SF2}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A4-PS{6A:SF2}I-I, CH_REF=BR:A4-PS{6A:SF2}I-I_Ref, CH_TOL=BR:A4-PS{6A:SF2}I_I_Tol-SP, CH_ARCH=BR:A4-PS{6A:SF2}I_I_Arch-I, CH_DIFFREF=BR:A4-PS{6A:SF2}I_I_DiffRef-I, CH_DIFFARCH=BR:A4-PS{6A:SF2}I_I_DiffArch-I, CH_FLG=BR:A4-PS{6A:SF2}I_I_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:SF2}I_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:SF2}I-I, CH_REF=BR:A4-PS{6A:SF2}I-I_Ref, CH_DIFFREF=BR:A4-PS{6A:SF2}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:SF2}I-I, CH_REF=BR:A4-PS{6A:SF2}I-SP-1k, CH_DIFFREF=BR:A4-PS{6A:SF2}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A4-PS{6A:SF2}I:DAC-I, CH_REF=BR:A4-PS{6A:SF2}I:DAC-I_Ref, CH_TOL=BR:A4-PS{6A:SF2}I:DAC_I_Tol-SP,  CH_ARCH=BR:A4-PS{6A:SF2}I:DAC_I_Arch-I, CH_DIFFREF=BR:A4-PS{6A:SF2}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR:A4-PS{6A:SF2}I:DAC_I_DiffArch-I, CH_FLG=BR:A4-PS{6A:SF2}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:SF2}I:DAC_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:SF2}I:DAC-I, CH_REF=BR:A4-PS{6A:SF2}I:DAC-I_Ref, CH_DIFFREF=BR:A4-PS{6A:SF2}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:SF2}I:DAC-I, CH_REF=BR:A4-PS{6A:SF2}I-SP-1k, CH_DIFFREF=BR:A4-PS{6A:SF2}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:A4-PS{6A:SF2}E:PS-I, CH_REF=BR:A4-PS{6A:SF2}E:PS-I_Ref, CH_TOL=BR:A4-PS{6A:SF2}E:PS_I_Tol-SP, CH_ARCH=BR:A4-PS{6A:SF2}E:PS_I_Arch-I, CH_DIFFREF=BR:A4-PS{6A:SF2}E:PS_I_DiffRef-I, CH_DIFFARCH=BR:A4-PS{6A:SF2}E:PS_I_DiffArch-I, CH_FLG=BR:A4-PS{6A:SF2}E:PS_I_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:SF2}E:PS_I_ArchFlg-Sts, COEFF=10, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:A4-PS{6A:SF2}E:PS-I, CH_REF=BR:A4-PS{6A:SF2}E:PS-I_Ref, CH_DIFFREF=BR:A4-PS{6A:SF2}E:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, MODE=2, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A4-PS{6A:SF2}Cmd:PwrOn-Cmd, CH_REF=BR:A4-PS{6A:SF2}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:A4-PS{6A:SF2}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:A4-PS{6A:SF2}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:SF2}Cmd:PwrOn_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A4-PS{6A:SF2}Cmd:PwrOn-Cmd, CH_REF=BR:A4-PS{6A:SF2}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:A4-PS{6A:SF2}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:A4-PS{6A:SF2}Sts:PSworks-Sts, CH_REF=BR:A4-PS{6A:SF2}Sts:PSworks-Sts_Ref, CH_ARCH=BR:A4-PS{6A:SF2}Sts:PSworks_Arch-Sts, CH_FLG=BR:A4-PS{6A:SF2}Sts:PSworks_MonitFlg-Sts, CH_FLGARCH=BR:A4-PS{6A:SF2}Sts:PSworks_ArchFlg-Sts")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:A4-PS{6A:SF2}Sts:PSworks-Sts, CH_REF=BR:A4-PS{6A:SF2}Sts:PSworks-Sts_Ref, CH_FLG=BR:A4-PS{6A:SF2}Sts:PSworks_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, MODE=2")


# PSC44 Channel: 1  no PS

var(PSCDebug, 1)
#with debug message: var(PSCDebug, 2)

#Tx socket
createPSC("TxPSC17", "br-psc17", 7, 0)
epicsThreadSleep 0.1
#Tx sim socket
#createPSC("TxPSC17", "localhost", 8765, 0)
#Rx socket
createPSC("RxPSC17", "br-psc17", 20, 1)
epicsThreadSleep 0.1
setPSCSendBlockSize("TxPSC17", 80, 128)

#Tx socket
createPSC("TxPSC18", "br-psc18", 7, 0)
epicsThreadSleep 0.1
#Tx sim socket
#createPSC("TxPSC18", "localhost", 8765, 0)
#Rx socket
createPSC("RxPSC18", "br-psc18", 20, 1)
epicsThreadSleep 0.1
setPSCSendBlockSize("TxPSC18", 80, 128)

#Tx socket
createPSC("TxPSC19", "br-psc19", 7, 0)
epicsThreadSleep 0.1
#Tx sim socket
#createPSC("TxPSC19", "localhost", 8765, 0)
#Rx socket
createPSC("RxPSC19", "br-psc19", 20, 1)
epicsThreadSleep 0.1
setPSCSendBlockSize("TxPSC19", 80, 128)

#Tx socket
createPSC("TxPSC20", "br-psc20", 7, 0)
epicsThreadSleep 0.1
#Tx sim socket
#createPSC("TxPSC20", "localhost", 8765, 0)
#Rx socket
createPSC("RxPSC20", "br-psc20", 20, 1)
epicsThreadSleep 0.1
setPSCSendBlockSize("TxPSC20", 80, 128)

#Tx socket
createPSC("TxPSC21", "br-psc21", 7, 0)
epicsThreadSleep 0.1
#Tx sim socket
#createPSC("TxPSC21", "localhost", 8765, 0)
#Rx socket
createPSC("RxPSC21", "br-psc21", 20, 1)
epicsThreadSleep 0.1
setPSCSendBlockSize("TxPSC21", 80, 128)

#Tx socket
createPSC("TxPSC22", "br-psc22", 7, 0)
epicsThreadSleep 0.1
#Tx sim socket
#createPSC("TxPSC22", "localhost", 8765, 0)
#Rx socket
createPSC("RxPSC22", "br-psc22", 20, 1)
epicsThreadSleep 0.1
setPSCSendBlockSize("TxPSC22", 80, 128)

#Tx socket
createPSC("TxPSC23", "br-psc23", 7, 0)
epicsThreadSleep 0.1
#Tx sim socket
#createPSC("TxPSC23", "localhost", 8765, 0)
#Rx socket
createPSC("RxPSC23", "br-psc23", 20, 1)
epicsThreadSleep 0.1
setPSCSendBlockSize("TxPSC23", 80, 128)

#Tx socket
createPSC("TxPSC24", "br-psc24", 7, 0)
epicsThreadSleep 0.1
#Tx sim socket
#createPSC("TxPSC24", "localhost", 8765, 0)
#Rx socket
createPSC("RxPSC24", "br-psc24", 20, 1)
epicsThreadSleep 0.1
setPSCSendBlockSize("TxPSC24", 80, 128)

#Tx socket
createPSC("TxPSC25", "br-psc25", 7, 0)
epicsThreadSleep 0.1
#Tx sim socket
#createPSC("TxPSC25", "localhost", 8765, 0)
#Rx socket
createPSC("RxPSC25", "br-psc25", 20, 1)
epicsThreadSleep 0.1
setPSCSendBlockSize("TxPSC25", 80, 128)

#Tx socket
createPSC("TxPSC26", "br-psc26", 7, 0)
epicsThreadSleep 0.1
#Tx sim socket
#createPSC("TxPSC26", "localhost", 8765, 0)
#Rx socket
createPSC("RxPSC26", "br-psc26", 20, 1)
epicsThreadSleep 0.1
setPSCSendBlockSize("TxPSC26", 80, 128)

#Tx socket
createPSC("TxPSC27", "br-psc27", 7, 0)
epicsThreadSleep 0.1
#Tx sim socket
#createPSC("TxPSC27", "localhost", 8765, 0)
#Rx socket
createPSC("RxPSC27", "br-psc27", 20, 1)
epicsThreadSleep 0.1
setPSCSendBlockSize("TxPSC27", 80, 128)

#Tx socket
createPSC("TxPSC28", "br-psc28", 7, 0)
epicsThreadSleep 0.1
#Tx sim socket
#createPSC("TxPSC28", "localhost", 8765, 0)
#Rx socket
createPSC("RxPSC28", "br-psc28", 20, 1)
epicsThreadSleep 0.1
setPSCSendBlockSize("TxPSC28", 80, 128)

#Tx socket
createPSC("TxPSC29", "br-psc29", 7, 0)
epicsThreadSleep 0.1
#Tx sim socket
#createPSC("TxPSC29", "localhost", 8765, 0)
#Rx socket
createPSC("RxPSC29", "br-psc29", 20, 1)
epicsThreadSleep 0.1
setPSCSendBlockSize("TxPSC29", 80, 128)

#Tx socket
createPSC("TxPSC30", "br-psc30", 7, 0)
epicsThreadSleep 0.1
#Tx sim socket
#createPSC("TxPSC30", "localhost", 8765, 0)
#Rx socket
createPSC("RxPSC30", "br-psc30", 20, 1)
epicsThreadSleep 0.1
setPSCSendBlockSize("TxPSC30", 80, 128)

#Tx socket
createPSC("TxPSC31", "br-psc31", 7, 0)
epicsThreadSleep 0.1
#Tx sim socket
#createPSC("TxPSC31", "localhost", 8765, 0)
#Rx socket
createPSC("RxPSC31", "br-psc31", 20, 1)
epicsThreadSleep 0.1
setPSCSendBlockSize("TxPSC31", 80, 128)

#Tx socket
createPSC("TxPSC32", "br-psc32", 7, 0)
epicsThreadSleep 0.1
#Tx sim socket
#createPSC("TxPSC32", "localhost", 8765, 0)
#Rx socket
createPSC("RxPSC32", "br-psc32", 20, 1)
epicsThreadSleep 0.1
setPSCSendBlockSize("TxPSC32", 80, 128)

#Tx socket
createPSC("TxPSC33", "br-psc33", 7, 0)
epicsThreadSleep 0.1
#Tx sim socket
#createPSC("TxPSC33", "localhost", 8765, 0)
#Rx socket
createPSC("RxPSC33", "br-psc33", 20, 1)
epicsThreadSleep 0.1
setPSCSendBlockSize("TxPSC33", 80, 128)

#Tx socket
createPSC("TxPSC34", "br-psc34", 7, 0)
epicsThreadSleep 0.1
#Tx sim socket
#createPSC("TxPSC34", "localhost", 8765, 0)
#Rx socket
createPSC("RxPSC34", "br-psc34", 20, 1)
epicsThreadSleep 0.1
setPSCSendBlockSize("TxPSC34", 80, 128)

#Tx socket
createPSC("TxPSC35", "br-psc35", 7, 0)
epicsThreadSleep 0.1
#Tx sim socket
#createPSC("TxPSC35", "localhost", 8765, 0)
#Rx socket
createPSC("RxPSC35", "br-psc35", 20, 1)
epicsThreadSleep 0.1
setPSCSendBlockSize("TxPSC35", 80, 128)

#Tx socket
createPSC("TxPSC36", "br-psc36", 7, 0)
epicsThreadSleep 0.1
#Tx sim socket
#createPSC("TxPSC36", "localhost", 8765, 0)
#Rx socket
createPSC("RxPSC36", "br-psc36", 20, 1)
epicsThreadSleep 0.1
setPSCSendBlockSize("TxPSC36", 80, 128)

#Tx socket
createPSC("TxPSC37", "br-psc37", 7, 0)
epicsThreadSleep 0.1
#Tx sim socket
#createPSC("TxPSC37", "localhost", 8765, 0)
#Rx socket
createPSC("RxPSC37", "br-psc37", 20, 1)
epicsThreadSleep 0.1
setPSCSendBlockSize("TxPSC37", 80, 128)

#Tx socket
createPSC("TxPSC38", "br-psc38", 7, 0)
epicsThreadSleep 0.1
#Tx sim socket
#createPSC("TxPSC38", "localhost", 8765, 0)
#Rx socket
createPSC("RxPSC38", "br-psc38", 20, 1)
epicsThreadSleep 0.1
setPSCSendBlockSize("TxPSC38", 80, 128)

#Tx socket
createPSC("TxPSC39", "br-psc39", 7, 0)
epicsThreadSleep 0.1
#Tx sim socket
#createPSC("TxPSC39", "localhost", 8765, 0)
#Rx socket
createPSC("RxPSC39", "br-psc39", 20, 1)
epicsThreadSleep 0.1
setPSCSendBlockSize("TxPSC39", 80, 128)

#Tx socket
createPSC("TxPSC40", "br-psc40", 7, 0)
epicsThreadSleep 0.1
#Tx sim socket
#createPSC("TxPSC40", "localhost", 8765, 0)
#Rx socket
createPSC("RxPSC40", "br-psc40", 20, 1)
epicsThreadSleep 0.1
setPSCSendBlockSize("TxPSC40", 80, 128)

#Tx socket
createPSC("TxPSC41", "br-psc41", 7, 0)
epicsThreadSleep 0.1
#Tx sim socket
#createPSC("TxPSC41", "localhost", 8765, 0)
#Rx socket
createPSC("RxPSC41", "br-psc41", 20, 1)
epicsThreadSleep 0.1
setPSCSendBlockSize("TxPSC41", 80, 128)

#Tx socket
createPSC("TxPSC42", "br-psc42", 7, 0)
epicsThreadSleep 0.1
#Tx sim socket
#createPSC("TxPSC42", "localhost", 8765, 0)
#Rx socket
createPSC("RxPSC42", "br-psc42", 20, 1)
epicsThreadSleep 0.1
setPSCSendBlockSize("TxPSC42", 80, 128)

#Tx socket
createPSC("TxPSC43", "br-psc43", 7, 0)
epicsThreadSleep 0.1
#Tx sim socket
#createPSC("TxPSC43", "localhost", 8765, 0)
#Rx socket
createPSC("RxPSC43", "br-psc43", 20, 1)
epicsThreadSleep 0.1
setPSCSendBlockSize("TxPSC43", 80, 128)

#Tx socket
createPSC("TxPSC44", "br-psc44", 7, 0)
epicsThreadSleep 0.1
#Tx sim socket
#createPSC("TxPSC44", "localhost", 8765, 0)
#Rx socket
createPSC("RxPSC44", "br-psc44", 20, 1)
epicsThreadSleep 0.1
setPSCSendBlockSize("TxPSC44", 80, 128)

### Save/Restore ###
set_savefile_path("${TOP}/../${IOCNAME}","/as/save")
set_requestfile_path("${TOP}/../${IOCNAME}","/as/req")
set_pass0_restoreFile("${IOCNAME}.sav")
set_pass1_restoreFile("${IOCNAME}_waveforms.sav")

### Start IOC ###
cd ${TOP}/iocBoot/${IOC}
iocInit()

### Channel Finder
#dbl > ${TOP}/../${IOCNAME}/records.dbl
#system "cp ${TOP}/../${IOCNAME}/records.dbl /cf-update/${HOSTNAME}.${IOCNAME}.dbl"

### Save/Restore ###
makeAutosaveFileFromDbInfo("${TOP}/../${IOCNAME}/as/req/${IOCNAME}.req", "autosaveFields_pass0")
makeAutosaveFileFromDbInfo("${TOP}/../${IOCNAME}/as/req/${IOCNAME}_waveforms.req", "autosaveFields_pass1")

create_monitor_set("${IOCNAME}.req", 5 , "")
create_monitor_set("${IOCNAME}_waveforms.req", 30 , "")

