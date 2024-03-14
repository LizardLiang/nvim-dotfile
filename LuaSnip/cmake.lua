local ls = require("luasnip")
local s = ls.s
local i = ls.insert_node
local t = ls.text_node

return {
  s({ trig = "cmake" }, {
    t({ "cmake_minimum_required(VERSION 3.17)", "", "" }),
    t({ "project(" }),
    i(1, "project_name"),
    t({ ")", "", "" }),
    t({ 'file(GLOB SOURCES "src/*.cpp" "src/*.cc" "src/*.c")', "", "" }),
    t({ 'file(GLOB HEADERS "include/*.h" "include/*.hpp")', "", "" }),
    t("add_executable("),
    i(1, "project_name"),
    t({ " ${SOURCES} ${HEADERS})", "", "" }),
    t("set_property(TARGET "),
    i(1, "project_name"),
    t({ " PROPERTY CXX_STANDARD 17)", "", "" }),
  }),
}
