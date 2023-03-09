# The MIT License
#
# Copyright (c) 2023 strangelookingnerd
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

$SymbolsPath = $PSScriptRoot + "\src\main\resources\images\symbols\"
$EmojiList = $PSScriptRoot + "\src\main\resources\jenkins\plugins\foldericon\EmojiFolderIcon\emojis.list"
$SVG = ".svg"
$EmojiPrefix = "emoji_"
$Placeholder = "PLACEHOLDER"
$SVGTemplate = "<svg xmlns=`"http://www.w3.org/2000/svg`" class=`"emoji`" viewBox=`"0 -50 100 100`" preserveAspectRatio=`"xMidYMid meet`">"`
               + "<text transform=`"scale(2, 2)`" font-size=`"40`" dy=`".25em`" dx=`"-.05em`">" + $Placeholder + "</text></svg>"


"Creating SVGs from " + $EmojiList | Out-Host

$counter = 0

$performance = Measure-Command {
    foreach ($line in Get-Content -Encoding UTF8 $EmojiList)
    {
        $splitLine = $line.Split(":")
        $name = $splitLine[0]
        $emoji = $splitLine[1]

        $content = $SVGTemplate.Replace($Placeholder, $emoji)
        $filename = $SymbolsPath + $EmojiPrefix + $name + $SVG

        "Writing " + $filename | Out-Host
        $content | Out-File -NoNewline -Encoding UTF8 -FilePath $filename

        $counter++
    }
}

"Done. Created " + $counter + " SVGs in " + $performance.Milliseconds + " ms" | Out-Host
