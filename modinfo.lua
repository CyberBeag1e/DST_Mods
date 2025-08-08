name = "Thankful Plants"
description = "When you tend to a plant, it expresses its gratitude."
author = "CyberBeagle"
version = "1.3"

dst_compatible          = true
all_clients_require_mod = false
client_only_mod         = false

api_version = 10

-- Configuration
configuration_options = {
    {
        name  = "font_size",
        label = "Font size",
        hover = "Size of the thank-you text",
        options = {
            {description = "24", data = 24},
            {description = "28", data = 28},
            {description = "32", data = 32},
            {description = "36", data = 36},
            {description = "40", data = 40},
        },
        default = 32,
    },

    {
        name  = "speech_time",
        label = "Bubble duration",
        hover = "How long (seconds) the speech bubble stays",
        options = {
            {description = "1", data = 1},
            {description = "2", data = 2},
            {description = "3", data = 3},
            {description = "4", data = 4},
            {description = "5", data = 5},
        },
        default = 2,
    },

    {
        name  = "say_chance",
        label = "Thank-you chance",
        hover = "Probability each plant will speak",
        options = {
            {description = "10 %",  data = 0.10},
            {description = "30 %",  data = 0.30},
            {description = "50 %",  data = 0.50},
            {description = "70 %",  data = 0.70},
            {description = "100 %", data = 1.00},
        },
        default = 0.70,
    },
}