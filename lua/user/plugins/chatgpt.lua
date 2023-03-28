local prompt = [[      ___           ___                       ___           ___
     /\__\         /|  |                     /\  \         /\__\
    /:/ _/_       |:|  |          ___        \:\  \       /:/ _/_         ___
   /:/ /\  \      |:|  |         /|  |        \:\  \     /:/ /\__\       /\__\
  /:/ /::\  \   __|:|  |        |:|  |    _____\:\  \   /:/ /:/ _/_     /:/  /
 /:/_/:/\:\__\ /\ |:|__|____    |:|  |   /::::::::\__\ /:/_/:/ /\__\   /:/__/
 \:\/:/ /:/  / \:\/:::::/__/  __|:|__|   \:\~~\~~\/__/ \:\/:/ /:/  /  /::\  \
  \::/ /:/  /   \::/~~/~     /::::\  \    \:\  \        \::/_/:/  /  /:/\:\  \
   \/_/:/  /     \:\~~\      ~~~~\:\  \    \:\  \        \:\/:/  /   \/__\:\  \
     /:/  /       \:\__\          \:\__\    \:\__\        \::/  /         \:\__\
     \/__/         \/__/           \/__/     \/__/         \/__/           \/__/  ]]

return {
  {
    "jackMort/ChatGPT.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    cmd = { "ChatGPT", "ChatGPTActAs", "ChatGPTEditWithInstructions" },
    cond = function()
      if not os.getenv("OPENAI_API_KEY") then
        print("Please set the environment variable OPENAI_API_KEY to your OpenAI API key to enable ChatGPT")
        return false
      end
      if not os.getenv("HOME") then
        print("Please set the environment variable HOME to your home directory to enable ChatGPT")
        return false
      end
      return true
    end,
    config = function()
      require("chatgpt").setup({
        welcome_message = prompt,
        question_sign = "",
        answer_sign = "󱚦",
        loading_text = "fetching response",
        chat_window = {
          border = {
            style = "rounded",
            text = {
              top = " Ask me anything! ",
            },
          },
        },
        chat_input = {
          prompt = " ",
          border = {
            style = "rounded",
          },
        },
        openai_params = {
          -- https://platform.openai.com/docs/models
          -- text-davinci-003 ; text-curie-001 ; text-babbage-001 ; text-ada-001 ; gpt-3.5-turbo
          model = "gpt-3.5-turbo",
          max_tokens = 1000,
        },
        openai_edit_params = {
          -- https://platform.openai.com/docs/guides/code/editing-code
          model = "code-davinci-edit-001",
        },
      })
    end,
  },
}
