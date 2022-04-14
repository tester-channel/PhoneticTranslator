function Write-PhoneticString([string]$stringToPhoneticString) {

<#
  .SYNOPSIS
    Enables functionality to transform a string of characters into its phonetic representation
  .DESCRIPTION
    Uses an input string that has been broken into an array
    and performs regex operations on each character of that array
    to determine the phonetic representation of that character 
    with a hashtable that contains all US Keyboard characters.
    Once the phonetic representation is determined, it is written
    to the output.

    ################################################
    # Write-PhoneticString Conversions
    ################################################
    # Alphabetic Conversions
    # "a" = "alfa"
    # "b" = "bravo"
    # "c" = "charlie"
    # "d" = "delta"
    # "e" = "echo"
    # "f" = "foxtrot"
    # "g" = "golf"
    # "h" = "hotel"
    # "i" = "india"
    # "j" = "juliett"
    # "k" = "kilo"
    # "l" = "lima"
    # "m" = "mike"
    # "n" = "november"
    # "o" = "oscar"
    # "p" = "papa"
    # "q" = "quebec"
    # "r" = "romeo"
    # "s" = "sierra"
    # "t" = "tango"
    # "u" = "uniform"
    # "v" = "victor"
    # "w" = "whiskey"
    # "x" = "x-ray"
    # "y" = "yankee"
    # "z" = "zulu"

    # Numeric Conversions
    # "0"="Zero"
    # "1"="One"
    # "2"="Two"
    # "3"="Three"
    # "4"="Four"
    # "5"="Five"
    # "6"="Six"
    # "7"="Seven"
    # "8"="Eight"
    # "9"="Nine"

    # Symobolic Conversions
    # "!" = "Exclamation Point"
    # '"' = "Double Quote"
    # "#" = "Pound"
    # "$" = "Dollar"
    # "%" = "Percent"
    # "&" = "Ampersand"
    # "'" = "Single Quote"
    # "(" = "Left Parenthesis"
    # ")" = "Right Parenthesis"
    # "*" = "Asterisk"
    # "+" = "Plus"
    # "," = "Comma"
    # "-" = "Minus"
    # "." = "Period"
    # "/" = "Forward Slash"
    # ":" = "Colon"
    # ";" = "Semicolon"
    # "<" = "Less Than"
    # "=" = "Equal"
    # ">" = "Greater Than"
    # "?" = "Question Mark"
    # "@" = "At Sign"
    # "[" = "Left Square Bracket"
    # "\" = "Backslash"
    # "]" = "Right Square Bracket"
    # "^" = "Caret"
    # "_" = "Underscore"
    # '`' = "Grave"
    # "{" = "Left Curly Bracket"
    # "|" = "Vertical Bar"
    # "}" = "Right Curly Bracket"
    # "~" = "Tilde"
    ################################################
  .PARAMETER $stringToPhoneticString
    Mandatory. String to be phonetically transformed
  .INPUTS
    [string]$stringToPhoneticString
  .OUTPUTS
    None
  .NOTES
    Version:        1.0
    Author:         James Ban
    Creation Date:  04/14/2022
    Purpose/Change: Initial function development
  .EXAMPLE
    Get-PhoneticString 'G2tu74#&lZCk7EgQ'
#>
    
    process {
        # Phonetic Map of all Standard US Keyboard Characters
        $phoneticCharacterMap = @{

            # Alphabetic Conversions
            "a" = "alfa"
            "b" = "bravo"
            "c" = "charlie"
            "d" = "delta"
            "e" = "echo"
            "f" = "foxtrot"
            "g" = "golf"
            "h" = "hotel"
            "i" = "india"
            "j" = "juliett"
            "k" = "kilo"
            "l" = "lima"
            "m" = "mike"
            "n" = "november"
            "o" = "oscar"
            "p" = "papa"
            "q" = "quebec"
            "r" = "romeo"
            "s" = "sierra"
            "t" = "tango"
            "u" = "uniform"
            "v" = "victor"
            "w" = "whiskey"
            "x" = "x-ray"
            "y" = "yankee"
            "z" = "zulu"

            # Numeric Conversions
            "0"="Zero"
            "1"="One"
            "2"="Two"
            "3"="Three"
            "4"="Four"
            "5"="Five"
            "6"="Six"
            "7"="Seven"
            "8"="Eight"
            "9"="Nine"

            # Symobolic Conversions
            "!" = "Exclamation Point"
            '"' = "Double Quote"
            "#" = "Number Sign"
            "$" = "Dollar"
            "%" = "Percent"
            "&" = "Ampersand"
            "'" = "Single Quote"
            "(" = "Left Parenthesis"
            ")" = "Right Parenthesis"
            "*" = "Asterisk"
            "+" = "Plus"
            "," = "Comma"
            "-" = "Minus"
            "." = "Period"
            "/" = "Forward Slash"
            ":" = "Colon"
            ";" = "Semicolon"
            "<" = "Less Than"
            "=" = "Equal"
            ">" = "Greater Than"
            "?" = "Question Mark"
            "@" = "At Sign"
            "[" = "Left Square Bracket"
            "\" = "Backslash"
            "]" = "Right Square Bracket"
            "^" = "Caret"
            "_" = "Underscore"
            '`' = "Grave"
            "{" = "Left Curly Bracket"
            "|" = "Vertical Bar"
            "}" = "Right Curly Bracket"
            "~" = "Tilde"
        }

        
        # For each individual character, find its phonetic equivilent in the singular hashtable
        function Rename-PhoneticCharacterMapper($char) {
            if ($phoneticCharacterMap.Contains($char)) {
                $result = $phoneticCharacterMap[$char]
            }
            else {
                throw "Invalid '$char'. Please Contact Support and reference this character."    
            }

            # In order to provide clarity with each output, this statement capitalizes
            # the phonetic string output if the original character was uppercase
            if ((Get-CharacterType($char)) -eq "uppercase") {
                $result = $result.ToUpper()
            }

            $result
        }

        # Convert this string into a character array and calls the mapper funciton to map each character
        [string[]]$translatedCharacters = $stringToPhoneticString.ToCharArray() |  ForEach-Object {
            Rename-PhoneticCharacterMapper $_.ToString()
        }

        $translatedCharacters -join $delimiter

    }  

}

function Write-Clr([string]$stringToColorizedString)
{
<#
  .SYNOPSIS
    Enables support to write multiple color text on a single line
  .DESCRIPTION
    Users color codes to enable support to write multiple color text on a single line
    ################################################
    # Write-Color Color Codes
    ################################################
    # ^cn = Normal Output Color
    # ^ck = Black
    # ^cb = Blue
    # ^cc = Cyan
    # ^ce = Gray
    # ^cg = Green
    # ^cm = Magenta
    # ^cr = Red
    # ^cw = White
    # ^cy = Yellow
    # ^cB = DarkBlue
    # ^cC = DarkCyan
    # ^cE = DarkGray
    # ^cG = DarkGreen
    # ^cM = DarkMagenta
    # ^cR = DarkRed
    ################################################
  .PARAMETER text
    Mandatory. Line of text to write
  .INPUTS
    [string]$stringToColorizedString
  .OUTPUTS
    None
  .NOTES
    Version:        1.0
    Author:         James Ban
    Creation Date:  04/14/2022
    Purpose/Change: Initial function development
  .EXAMPLE
    Write-Color "The ^cbBlue Kracken roams under the ^crRed sky!"
#>

    # We cannot assume the colorizer will be used in conjunction with functions such as "Add-ClrCodeCharacters"
    # that ensure that there will be the "^cx" pattern in the string.
    # Due to this, we must perform a check ff $stringToColorizedString contains any color codes.
    # If no color codes are found just Write-Host as normal to save resources.
    if (-not $stringToColorizedString.Contains("^c")) {
        Write-Host "$($stringToColorizedString)"
        return
    }

    # Checks to ensure the string starts with a color code to prevent empty/null value errors
    [boolean]$startsWithColor = $false
    if ($stringToColorizedString.StartsWith("^c")) { 
        $startsWithColor = $true 
    }
 
    # Split the array based on our color code delimeter
    [string[]]$colorCodedArray = $stringToColorizedString -split "\^c"


    # Counter used to keep track of the current position in the array
    [int]$count = 1

    # Itterates over each object in the string array
    # Reads the color coding array and writes based off that information
    $colorCodedArray | ForEach-Object {

        if ($count -eq 1 -and $startsWithColor -eq $false) {
            Write-Host $_ -NoNewline
            $count++
        }
        elseif ($_.Length -eq 0)
        {
            $count++
        }
        else
        {

            $char = $_.Substring(0,1)
            $color = ""
            switch -CaseSensitive ($char) {
                "b" { $color = "Blue" }
                "B" { $color = "DarkBlue" }
                "c" { $color = "Cyan" }
                "C" { $color = "DarkCyan" }
                "e" { $color = "Gray" }
                "E" { $color = "DarkGray" }
                "g" { $color = "Green" }
                "G" { $color = "DarkGreen" }
                "k" { $color = "Black" }
                "m" { $color = "Magenta" }
                "M" { $color = "DarkMagenta" }
                "r" { $color = "Red" }
                "R" { $color = "DarkRed" }
                "w" { $color = "White" }
                "y" { $color = "Yellow" }
            }

            # If there is no color stated for whatever reason, write a normal line.
            # Otherwise, write the line with the given color without making a new line.
            if ($color -eq "") {
                Write-Host $_.Substring(1) -NoNewline
            }
            else {
                Write-Host $_.Substring(1) -NoNewline -ForegroundColor $color
            }

            # Once the string array has been finished, a new line will be written
            if ($count -eq $colorCodedArray.Count) {
                Write-Host ""
            }
            $count++
        }
    }
}




# Takes in a single string "$char" character and performs various regex operations to determine
# what type of character it is.
# Returns a "$charType" string indication the character type 
function Get-CharacterType([string]$char) {

    [string]$charType = ''

    switch ($char) {
        {$char -cmatch "^[A-Z]$"} { $charType = "uppercase"; break } # Uppercase Check
        {$char -cmatch "^[a-z]$"} { $charType = "lowercase"; break } # Lowercase Check
        {$char -cmatch "^[0-9]$"} { $charType = "numeric"; break } # Numeric Check
        {$char -match '[^a-zA-Z0-9]'} { $charType = "special"; break } # Special Character Check
        default { throw "Invalid '$char'. Please Contact Enterprise Support Center and reference this character."  }
    }


    return $charType

}

function Add-CaretPrefex([string]$char)
{
    [string]$prefix = '^c'

    # Passes the current character into a helper function that determines the character's type and
    # Appends the propper color to the string.
    switch (Get-CharacterType($char)) {
        "uppercase" { $result = -join($prefix, 'c', $char); break }
        "lowercase" { $result = -join($prefix, 'g', $char); break }
        "numeric" { $result = -join($prefix, 'y', $char); break }
        "special" { $result = -join($prefix, 'r', $char); break }
        default { throw "Invalid '$char'. Please Contact Enterprise Support Center and reference this character." }
     }


    return $result
}

# Appends a '^c' and the appropriate color code (c, g, y, r, etc) to the
# beginning of the current character for later color processing.
# Write-Clr function uses '^cg' to determine how to color the text.
# For example, the above '^cg' would represent 'green'
# Returns the modified combined string
function Add-ClrCodeCharacters([string]$stringToSplit)
{

    [string[]]$appendedCharacters = $stringToSplit.ToCharArray() |  ForEach-Object {
        Add-CaretPrefex $_.ToString()
    }

    return $appendedCharacters -join "".ToString()
}

Function Get-TransformedText {

<#
  .SYNOPSIS
    Enables functionality to transform a string of characters into both a 
    colorized and phonetic representation for ease of readability
  .DESCRIPTION
    Uses an input string and performs various comparisons and
    reges operations to determine the type of character and what
    character it is. Using that that information, two outputs
    (colorized and phonetic) are created. 
  .PARAMETER $stringToSplit
    ValueFromPipeLine.
    Mandatory.
    String to be transformed
  .PARAMETER $Demimiter
    ValueFromPipeLine.
    Mandatory.
    Defaults to " - "
    Determines how the phonetic output will be separated.
  .INPUTS
    [string]$stringToSplit
    [string]$delimiter
  .OUTPUTS
    None
  .NOTES
    Version:        1.0
    Author:         James Ban
    Creation Date:  04/14/2022
    Purpose/Change: Initial function development
  .EXAMPLE
    Get-TransformedText 'G2tu74#&lZCk7EgQ'
#>

    param(
        [parameter(ValueFromPipeline=$true, Mandatory=$true)]
        [string]$stringToSplit,
        [string]$delimiter = " - "
    )

    # Original String
    $stringToSplit

    # Colorized String
    Write-Clr(Add-ClrCodeCharacters($stringToSplit))

    # Phonetic String
    Write-PhoneticString($stringToSplit) -join ""
}
