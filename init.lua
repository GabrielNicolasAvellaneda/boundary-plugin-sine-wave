-- Copyright 2015 Boundary, Inc.
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--    http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

local framework = require('framework')
local Plugin = framework.Plugin
local RandomDataSource = framework.RandomDataSource

local params = framework.params
params.name = 'Boundary Sin-Wave Plugin'
params.version = '1.0'
params.minValue = params.minValue or 1
params.maxValue = params.maxValue or 100

local data_source = RandomDataSource:new(params.minValue, params.maxValue)
local plugin = Plugin:new(params, data_source)

function plugin:onParseValues(val)
    local result = {}
    result['BOUNDARY_SINE_WAVE_AMPLITUDE'] = val
    return result 
end

plugin:run()
