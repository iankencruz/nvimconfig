return {
	"nathom/filetype.nvim",

	config = function()
		require("filetype").setup({
			overrides = {
				extensions = {
					tmpl = "html",
				}
			}
		})
	end

}
