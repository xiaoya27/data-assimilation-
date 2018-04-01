import numpy as np

#=================================================================
# GENERAL SECTION
#=================================================================

GeneralConf=dict()

GeneralConf['ExpName']='LETKFPerfectModel'                            #Experiment name.
GeneralConf['DataPath']='./data/Forecast/'                            #Data output path
GeneralConf['FigPath']='./figs/Forecast/'                             #Figures output path
GeneralConf['RunSave']=True                                           #Save the output.
GeneralConf['RunPlot']=True                                           #Plot Diagnostics.
GeneralConf['OutFile']='Forecast' + GeneralConf['ExpName'] + '.npz'   #Output file containing the forecasts.

#File with the initial conditions
GeneralConf['AssimilationFile']='./data/Assimilation/Assimilation' + GeneralConf['ExpName'] + '.npz'
#File with the nature run (for forecast verification)
GeneralConf['NatureFile']      ='./data/Nature/NatureConstantParameter.npz'

#=================================================================
#  FORECAST SECTION :
#=================================================================

ForConf=dict()

ForConf['FreqOut'] = 8                               #Forecast output frequency (in number of time steps)

ForConf['ForecastLength'] = 4 * 50                   #Maximum forecast lead time (in number of time steps)

ForConf['AnalysisSpinUp'] = 400                      #Analysis cycles to skip befor running the first forecast.


