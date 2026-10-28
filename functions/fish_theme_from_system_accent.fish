# Fish Theme - Dynamically generated from system accent color
# Matches the Neovim system-accent theme

function fish_theme_from_system_accent -d "Apply fish theme based on system accent color"
    # Get system accent color
    set -l accent_color (get_system_accent_color)

    # Generate complementary colors based on accent
    set -l colors (generate_fish_palette $accent_color)

    # Apply fish colors
    set -g fish_color_normal $colors[1]                # Normal text
    set -g fish_color_command $colors[2]               # Commands (accent-based)
    set -g fish_color_keyword $colors[3]               # Keywords
    set -g fish_color_quote $colors[4]                 # Strings
    set -g fish_color_redirection $colors[5]           # Redirections
    set -g fish_color_end $colors[6]                   # ; and &
    set -g fish_color_error $colors[7]                 # Errors
    set -g fish_color_param $colors[8]                 # Parameters
    set -g fish_color_comment $colors[9]               # Comments
    set -g fish_color_selection $colors[10]            # Selection background
    set -g fish_color_operator $colors[11]             # Operators like * and ~
    set -g fish_color_escape $colors[12]               # Escape sequences
    set -g fish_color_autosuggestion $colors[13]       # Autosuggestions
    set -g fish_color_cwd $colors[14]                  # Current directory
    set -g fish_color_cwd_root $colors[15]             # Current directory as root
    set -g fish_color_user $colors[16]                 # Username
    set -g fish_color_host $colors[17]                 # Hostname
    set -g fish_color_host_remote $colors[18]          # Remote hostname
    set -g fish_color_status $colors[19]               # Last command status
    set -g fish_color_cancel $colors[20]               # ^C indicator
    set -g fish_color_search_match $colors[21]         # History search match
    set -g fish_color_valid_path $colors[21]           # Valid paths with underline

    # Pager colors
    set -g fish_pager_color_progress $colors[22]       # Progress bar
    set -g fish_pager_color_background $colors[23]     # Background
    set -g fish_pager_color_prefix $colors[24]         # Prefix string
    set -g fish_pager_color_completion $colors[25]     # Completion text
    set -g fish_pager_color_description $colors[26]    # Description text
    set -g fish_pager_color_selected_background $colors[27] # Selected background
    set -g fish_pager_color_selected_prefix $colors[28]     # Selected prefix
    set -g fish_pager_color_selected_completion $colors[29] # Selected completion
    set -g fish_pager_color_selected_description $colors[30] # Selected description
    set -g fish_pager_color_secondary_background $colors[31] # Alternate row color
    set -g fish_pager_color_secondary_prefix $colors[32]     # Alternate prefix
    set -g fish_pager_color_secondary_completion $colors[33] # Alternate completion
    set -g fish_pager_color_secondary_description $colors[34] # Alternate description
end
