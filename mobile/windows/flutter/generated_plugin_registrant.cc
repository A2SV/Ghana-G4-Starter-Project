//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <smart_auth/smart_auth_plugin.h>
#include <validation_pro/validation_pro_plugin_c_api.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  SmartAuthPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("SmartAuthPlugin"));
  ValidationProPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("ValidationProPluginCApi"));
}
