--[[
Configuration for GlyphNet
Copyright Xiang Zhang 2015-2016
--]]

-- Name space
local config = {}

-- Training data configurations
config.train_data = {}
config.train_data.file = 'data/dianping/train_code.t7b'
config.train_data.unifont = 'unifont/unifont-8.0.01.t7b'
config.train_data.batch = 16

-- Testing data configurations
config.test_data = {}
config.test_data.file = 'data/dianping/test_code.t7b'
config.test_data.unifont = 'unifont/unifont-8.0.01.t7b'
config.test_data.batch = 16

-- Model configurations
config.model = {}
config.model.cudnn = true
config.model.group = 16

-- Model variations configuration
config.variation = {}

-- Large network configuration
local spatial = {}
spatial[1] = {name = 'nn.SpatialConvolution',
              nInputPlane = 1, nOutputPlane = 64,
              kW = 3, kH = 3, dW = 1, dH = 1, padW = 1, padH = 1}
spatial[2] = {name = 'nn.Threshold', th = 1e-6, v = 0, ip = true}
spatial[3] = {name = 'nn.SpatialConvolution',
              nInputPlane = 64, nOutputPlane = 64,
              kW = 3, kH = 3, dW = 1, dH = 1, padW = 1, padH = 1}
spatial[4] = {name = 'nn.Threshold', th = 1e-6, v = 0, ip = true}
spatial[5] = {name = 'nn.SpatialMaxPooling',
              kW = 2, kH = 2, dW = 2, dH = 2, padW = 0, padH = 0}
spatial[6] = {name = 'nn.SpatialConvolution',
              nInputPlane = 64, nOutputPlane = 128,
              kW = 3, kH = 3, dW = 1, dH = 1, padW = 1, padH = 1}
spatial[7] = {name = 'nn.Threshold', th = 1e-6, v = 0, ip = true}
spatial[8] = {name = 'nn.SpatialConvolution',
              nInputPlane = 128, nOutputPlane = 128,
              kW = 3, kH = 3, dW = 1, dH = 1, padW = 1, padH = 1}
spatial[9] = {name = 'nn.Threshold', th = 1e-6, v = 0, ip = true}
spatial[10] = {name = 'nn.SpatialMaxPooling',
               kW = 2, kH = 2, dW = 2, dH = 2, padW = 0, padH = 0}
spatial[11] = {name = 'nn.SpatialConvolution',
              nInputPlane = 128, nOutputPlane = 256,
              kW = 3, kH = 3, dW = 1, dH = 1, padW = 1, padH = 1}
spatial[12] = {name = 'nn.Threshold', th = 1e-6, v = 0, ip = true}
spatial[13] = {name = 'nn.SpatialConvolution',
              nInputPlane = 256, nOutputPlane = 256,
              kW = 3, kH = 3, dW = 1, dH = 1, padW = 1, padH = 1}
spatial[14] = {name = 'nn.Threshold', th = 1e-6, v = 0, ip = true}
spatial[15] = {name = 'nn.SpatialMaxPooling',
              kW = 2, kH = 2, dW = 2, dH = 2, padW = 0, padH = 0}
spatial[16] = {name = 'nn.Reshape', size = 1024, bachMode = true}
spatial[17] = {name = 'nn.Linear', inputSize = 1024, outputSize = 1024}
spatial[18] = {name = 'nn.Threshold', th = 1e-6, v = 0, ip = true}
spatial[19] = {name = 'nn.Linear', inputSize = 1024, outputSize = 256}
spatial[20] = {name = 'nn.Threshold', th = 1e-6, v = 0, ip = true}
local temporal = {}
temporal[1] = {name = 'nn.TemporalConvolutionMM', inputFrameSize = 256,
               outputFrameSize = 256, kW = 3, dW = 1, padW = 1}
temporal[2] = {name = 'nn.Threshold', th = 1e-6, v = 0, ip = true}
temporal[3] = {name = 'nn.TemporalConvolutionMM', inputFrameSize = 256,
               outputFrameSize = 256, kW = 3, dW = 1, padW = 1}
temporal[4] = {name = 'nn.Threshold', th = 1e-6, v = 0, ip = true}
temporal[5] = {name = 'nn.TemporalMaxPoolingMM', kW = 2, dW = 2}
temporal[6] = {name = 'nn.TemporalConvolutionMM', inputFrameSize = 256,
               outputFrameSize = 256, kW = 3, dW = 1, padW = 1}
temporal[7] = {name = 'nn.Threshold', th = 1e-6, v = 0, ip = true}
temporal[8] = {name = 'nn.TemporalConvolutionMM', inputFrameSize = 256,
               outputFrameSize = 256, kW = 3, dW = 1, padW = 1}
temporal[9] = {name = 'nn.Threshold', th = 1e-6, v = 0, ip = true}
temporal[10] = {name = 'nn.TemporalMaxPoolingMM', kW = 2, dW = 2}
temporal[11] = {name = 'nn.TemporalConvolutionMM', inputFrameSize = 256,
                outputFrameSize = 256, kW = 3, dW = 1, padW = 1}
temporal[12] = {name = 'nn.Threshold', th = 1e-6, v = 0, ip = true}
temporal[13] = {name = 'nn.TemporalConvolutionMM', inputFrameSize = 256,
                outputFrameSize = 256, kW = 3, dW = 1, padW = 1}
temporal[14] = {name = 'nn.Threshold', th = 1e-6, v = 0, ip = true}
temporal[15] = {name = 'nn.TemporalMaxPoolingMM', kW = 2, dW = 2}
temporal[16] = {name = 'nn.TemporalConvolutionMM', inputFrameSize = 256,
                outputFrameSize = 256, kW = 3, dW = 1, padW = 1}
temporal[17] = {name = 'nn.Threshold', th = 1e-6, v = 0, ip = true}
temporal[18] = {name = 'nn.TemporalConvolutionMM', inputFrameSize = 256,
                outputFrameSize = 256, kW = 3, dW = 1, padW = 1}
temporal[19] = {name = 'nn.Threshold', th = 1e-6, v = 0, ip = true}
temporal[20] = {name = 'nn.TemporalMaxPoolingMM', kW = 2, dW = 2}
temporal[21] = {name = 'nn.TemporalConvolutionMM', inputFrameSize = 256,
                outputFrameSize = 256, kW = 3, dW = 1, padW = 1}
temporal[22] = {name = 'nn.Threshold', th = 1e-6, v = 0, ip = true}
temporal[23] = {name = 'nn.TemporalConvolutionMM', inputFrameSize = 256,
                outputFrameSize = 256, kW = 3, dW = 1, padW = 1}
temporal[24] = {name = 'nn.Threshold', th = 1e-6, v = 0, ip = true}
temporal[25] = {name = 'nn.TemporalMaxPoolingMM', kW = 2, dW = 2}
temporal[26] = {name = 'nn.Reshape', size = 4096, batchMode = true}
temporal[27] = {name = 'nn.Linear', inputSize = 4096, outputSize = 1024}
temporal[28] = {name = 'nn.Threshold', th = 1e-6, v = 0, ip = true}
temporal[29] = {name = 'nn.Dropout', p = 0.5, v2 = true, inplace = true}
temporal[30] = {name = 'nn.Linear', inputSize = 1024, outputSize = 2}
temporal[31] = {name = 'nn.LogSoftMax'}
config.variation['large'] =
   {spatial = spatial, temporal = temporal, length = 512}

-- Small network configuration
local spatial = {}
spatial[1] = {name = 'nn.SpatialConvolution',
              nInputPlane = 1, nOutputPlane = 64,
              kW = 3, kH = 3, dW = 1, dH = 1, padW = 2, padH = 2}
spatial[2] = {name = 'nn.Threshold', th = 1e-6, v = 0, ip = true}
spatial[3] = {name = 'nn.SpatialConvolution',
              nInputPlane = 64, nOutputPlane = 64,
              kW = 3, kH = 3, dW = 1, dH = 1, padW = 1, padH = 1}
spatial[4] = {name = 'nn.Threshold', th = 1e-6, v = 0, ip = true}
spatial[5] = {name = 'nn.SpatialMaxPooling',
              kW = 3, kH = 3, dW = 3, dH = 3, padW = 0, padH = 0}
spatial[6] = {name = 'nn.SpatialConvolution',
              nInputPlane = 64, nOutputPlane = 128,
              kW = 3, kH = 3, dW = 1, dH = 1, padW = 1, padH = 1}
spatial[7] = {name = 'nn.Threshold', th = 1e-6, v = 0, ip = true}
spatial[8] = {name = 'nn.SpatialConvolution',
              nInputPlane = 128, nOutputPlane = 128,
              kW = 3, kH = 3, dW = 1, dH = 1, padW = 1, padH = 1}
spatial[9] = {name = 'nn.Threshold', th = 1e-6, v = 0, ip = true}
spatial[10] = {name = 'nn.SpatialMaxPooling',
               kW = 3, kH = 3, dW = 3, dH = 3, padW = 0, padH = 0}
spatial[11] = {name = 'nn.Reshape', size = 512, bachMode = true}
spatial[12] = {name = 'nn.Linear', inputSize = 512, outputSize = 256}
spatial[13] = {name = 'nn.Threshold', th = 1e-6, v = 0, ip = true}
spatial[14] = {name = 'nn.Linear', inputSize = 256, outputSize = 256}
spatial[15] = {name = 'nn.Threshold', th = 1e-6, v = 0, ip = true}
local temporal = {}
temporal[1] = {name = 'nn.TemporalConvolutionMM', inputFrameSize = 256,
               outputFrameSize = 256, kW = 3, dW = 1, padW = 1}
temporal[2] = {name = 'nn.Threshold', th = 1e-6, v = 0, ip = true}
temporal[3] = {name = 'nn.TemporalConvolutionMM', inputFrameSize = 256,
               outputFrameSize = 256, kW = 3, dW = 1, padW = 1}
temporal[4] = {name = 'nn.Threshold', th = 1e-6, v = 0, ip = true}
temporal[5] = {name = 'nn.TemporalMaxPoolingMM', kW = 3, dW = 3}
temporal[6] = {name = 'nn.TemporalConvolutionMM', inputFrameSize = 256,
               outputFrameSize = 256, kW = 3, dW = 1, padW = 1}
temporal[7] = {name = 'nn.Threshold', th = 1e-6, v = 0, ip = true}
temporal[8] = {name = 'nn.TemporalConvolutionMM', inputFrameSize = 256,
               outputFrameSize = 256, kW = 3, dW = 1, padW = 1}
temporal[9] = {name = 'nn.Threshold', th = 1e-6, v = 0, ip = true}
temporal[10] = {name = 'nn.TemporalMaxPoolingMM', kW = 3, dW = 3}
temporal[11] = {name = 'nn.TemporalConvolutionMM', inputFrameSize = 256,
                outputFrameSize = 256, kW = 3, dW = 1, padW = 1}
temporal[12] = {name = 'nn.Threshold', th = 1e-6, v = 0, ip = true}
temporal[13] = {name = 'nn.TemporalConvolutionMM', inputFrameSize = 256,
                outputFrameSize = 256, kW = 3, dW = 1, padW = 1}
temporal[14] = {name = 'nn.Threshold', th = 1e-6, v = 0, ip = true}
temporal[15] = {name = 'nn.TemporalMaxPoolingMM', kW = 3, dW = 3}
temporal[16] = {name = 'nn.Reshape', size = 4608, batchMode = true}
temporal[17] = {name = 'nn.Linear', inputSize = 4608, outputSize = 1024}
temporal[18] = {name = 'nn.Threshold', th = 1e-6, v = 0, ip = true}
temporal[19] = {name = 'nn.Dropout', p = 0.5, v2 = true, inplace = true}
temporal[20] = {name = 'nn.Linear', inputSize = 1024, outputSize = 2}
temporal[21] = {name = 'nn.LogSoftMax'}
config.variation['small'] =
   {spatial = spatial, temporal = temporal, length = 486}

-- Trainer settings
config.train = {}
config.train.momentum = 0.9
config.train.decay = 1e-5
-- These are just multipliers to config.driver.rate
-- For every config.driver.schedule * config.driver.steps
config.train.rates =
   {1/1, 1/2, 1/4, 1/8, 1/16, 1/32, 1/64, 1/128, 1/256, 1/512, 1/1024}

-- Tester settings
config.test = {}

-- Visualizer settings
config.visualizer = {}
config.visualizer.width = 1200
config.visualizer.scale = 4
config.visualizer.height = 64

-- Driver configurations
config.driver = {}
config.driver.type = 'torch.CudaTensor'
config.driver.device = 1
config.driver.loss = 'nn.ClassNLLCriterion'
config.driver.variation = 'large'
config.driver.steps = 100000
config.driver.epoches = 100
config.driver.schedule = 8
config.driver.rate = 1e-5
config.driver.interval = 5
config.driver.location = 'models/dianping/spatial8temporal12length512feature256'
config.driver.plot = true
config.driver.visualize = true
config.driver.debug = false
config.driver.resume = false

-- Main configuration
config.joe = {}

return config
