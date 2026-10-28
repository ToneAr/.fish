function get_system_accent_color -d "Get system accent color from various sources"
    # macOS: AppleAccentColor is an index into the system palette, and is
    # absent when the default (blue / multicolor) accent is selected
    if test (uname) = Darwin
        set -l mac_accent (defaults read -g AppleAccentColor 2>/dev/null)
        # Dark appearance variants of the system colors
        switch "$mac_accent"
            case -1
                echo "#8c8c8c" # Graphite
            case 0
                echo "#ff453a" # Red
            case 1
                echo "#ff9f0a" # Orange
            case 2
                echo "#ffd60a" # Yellow
            case 3
                echo "#32d74b" # Green
            case 5
                echo "#bf5af2" # Purple
            case 6
                echo "#ff375f" # Pink
            case '*'
                echo "#0a84ff" # Blue / Multicolor
        end
        return 0
    end

    # Try KDE Plasma accent color (most reliable)
    set -l kde_accent
    command -q kreadconfig6; and set kde_accent (kreadconfig6 --file kdeglobals --group General --key AccentColor 2>/dev/null)
    if test -n "$kde_accent"
        # KDE format: "r,g,b" - convert to hex
        set -l rgb (string split ',' $kde_accent)
        if test (count $rgb) -eq 3
            printf "#%02x%02x%02x\n" $rgb[1] $rgb[2] $rgb[3]
            return 0
        end
    end
    
    # Try GNOME/GTK accent color from settings
    set -l gnome_accent
    command -q gsettings; and set gnome_accent (gsettings get org.gnome.desktop.interface accent-color 2>/dev/null | string trim -c "'" | string trim)
    if test -n "$gnome_accent"
        # GNOME uses named colors
        switch $gnome_accent
            case blue
                echo "#3584e4"
                return 0
            case green
                echo "#33d17a"
                return 0
            case yellow
                echo "#f6d32d"
                return 0
            case orange
                echo "#ff7800"
                return 0
            case red
                echo "#e01b24"
                return 0
            case purple
                echo "#9141ac"
                return 0
            case brown
                echo "#986a44"
                return 0
            case slate
                echo "#99c1f1"
                return 0
        end
    end
    
    # Try GTK CSS files
    if test -f ~/.config/gtk-3.0/gtk.css
        set -l gtk_accent (string match -r -g '@define-color accent_color (#[0-9a-fA-F]{6})' < ~/.config/gtk-3.0/gtk.css)[1]
        if test -n "$gtk_accent"
            echo $gtk_accent
            return 0
        end
    end
    
    if test -f ~/.config/gtk-4.0/gtk.css
        set -l gtk4_accent (string match -r -g '@define-color accent_bg_color (#[0-9a-fA-F]{6})' < ~/.config/gtk-4.0/gtk.css)[1]
        if test -n "$gtk4_accent"
            echo $gtk4_accent
            return 0
        end
    end
    
    # Default fallback (a nice blue)
    echo "#5B9BD5"
end
