// myextension.cpp
// Extension lib defines
#define EXTENSION_NAME utf8
#define LIB_NAME "utf8"
#define MODULE_NAME "utf8"
// include the Defold SDK
#include <dmsdk/sdk.h>
#include "lutf8lib.h"

static void LuaInit(lua_State* L){
	int top = lua_gettop(L);
	lua_register_utf8(L);
	assert(top == lua_gettop(L));
}

static dmExtension::Result InitializeMyExtension(dmExtension::Params* params) {
    LuaInit(params->m_L);
    printf("Registered %s Extension\n", MODULE_NAME);
    return dmExtension::RESULT_OK;
}
static dmExtension::Result FinalizeMyExtension(dmExtension::Params* params) { return dmExtension::RESULT_OK;}
static dmExtension::Result UpdateMyExtension(dmExtension::Params* params) { return dmExtension::RESULT_OK;}



DM_DECLARE_EXTENSION(EXTENSION_NAME, LIB_NAME, NULL, NULL, InitializeMyExtension, UpdateMyExtension, 0, FinalizeMyExtension)
