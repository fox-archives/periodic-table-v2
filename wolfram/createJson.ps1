# Gets current path of current file
$baseDir = $(Split-Path $PsCommandPath)

cd atom-colors
wolframscript -script atom-block.wls
wolframscript -script atom-classification.wls
cd $baseDir

cd atom-isotopes-tab
wolframscript -script atom-isotopes.wls
cd $baseDir

cd atom-placement
wolframscript -script atom-placement.wls
cd $baseDir

cd atom-properties-tab
# wolframscript -script properties.wls
cd $baseDir

Write-Host "Generation Complete"