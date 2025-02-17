#include "ModuleManager.hpp"
#include "HUD.h"

#include "../util/StringH.hpp"

ModuleManager::ModuleManager() {
	modules.push_back(&HUD::i());
}

Module* ModuleManager::getModuleByName(std::string name) {
	for (Module* mod : modules) {
		if (StringH::equalsIgnoreCase(mod->getName(), name))return mod;
	}
	return NULL;
}
