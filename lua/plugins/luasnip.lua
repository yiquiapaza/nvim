return {
	"L3MON4D3/LuaSnip",
	version = "2.*",
	build = "make install_jsregexp",
	event = "VeryLazy",
	config = function()
		require("core.luasnip")
	end,
}
