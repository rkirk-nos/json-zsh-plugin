function jq_pretty() {
    local filename="$1"
    
    # Check if filename is provided
    if [[ -z "$filename" ]]; then
        echo "Error: Please provide a filename" >&2
        echo "Usage: jq_pretty <filename>" >&2
        return 1
    fi
    
    # Check if file exists
    if [[ ! -f "$filename" ]]; then
        echo "Error: File '$filename' does not exist" >&2
        return 1
    fi
    
    # Check if jq is available
    if ! command -v jq >/dev/null 2>&1; then
        echo "Error: jq is not installed or not in PATH" >&2
        return 1
    fi
    
    # Check if sponge is available
    if ! command -v sponge >/dev/null 2>&1; then
        echo "Error: sponge is not installed or not in PATH" >&2
        return 1
    fi
    
    # Pretty print the JSON file in place using jq and sponge
    if jq . "$filename" | sponge "$filename"; then
        echo "Successfully pretty-printed '$filename'"
    else
        echo "Error: Failed to pretty-print '$filename'. Check if it contains valid JSON." >&2
        return 1
    fi
}

function jq_ugly() {
    local filename="$1"
    
    # Check if filename is provided
    if [[ -z "$filename" ]]; then
        echo "Error: Please provide a filename" >&2
        echo "Usage: jq_ugly <filename>" >&2
        return 1
    fi
    
    # Check if file exists
    if [[ ! -f "$filename" ]]; then
        echo "Error: File '$filename' does not exist" >&2
        return 1
    fi
    
    # Check if jq is available
    if ! command -v jq >/dev/null 2>&1; then
        echo "Error: jq is not installed or not in PATH" >&2
        return 1
    fi
    
    # Check if sponge is available
    if ! command -v sponge >/dev/null 2>&1; then
        echo "Error: sponge is not installed or not in PATH" >&2
        return 1
    fi
    
    # Compact the JSON file in place using jq -c and sponge
    if jq -c . "$filename" | sponge "$filename"; then
        echo "Successfully compacted '$filename'"
    else
        echo "Error: Failed to compact '$filename'. Check if it contains valid JSON." >&2
        return 1
    fi
}