
// this file returns the params for the current qbec environment
// you need to add an entry here every time you add a new environment.

local env = std.extVar('qbec.io/env');
local base = import './environments/base.libsonnet';
local default = import './environments/default.libsonnet';
//local prod = default;
//prod.components.hello.indexData = 'hello prod from params';
local production = default {
  components +: {
    hello +: {
      replicas: 3,
    },
    hello2 +: {
      replicas: 3,
    },
  }
};

local stage = default {
  components +: {
    hello +: {
      replicas: 1,
    },
    hello2 +: {
      replicas: 1,
    },
  }
};

local paramsMap = {
  _: base,
  default: default,
  stage: default,
  production: production,
};

if std.objectHas(paramsMap, env) then paramsMap[env] else error 'environment ' + env + ' not defined in ' + std.thisFile

