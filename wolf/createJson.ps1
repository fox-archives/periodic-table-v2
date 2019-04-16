# Gets current path of current file
# baseDir="$0"
$baseDir = $(Split-Path $PsCommandPath)

cd all-properties-tab
wolframscript -script all-properties-data.wls
cd $baseDir

cd atomic-properties-tab
wolframscript -script atomic-data.wls
cd $baseDir

cd generic-atom-data
# wolframscript -script block.wls
# wolframscript -script classification.wls
# wolframscript -script placement.wls
cd $baseDir

cd material-properties-tab
wolframscript -script material-data.wls
cd $baseDir

cd thermodynamic-properties-tab
wolframscript -script thermodynamic-data.wls
cd $baseDir

Write-Host "Generation Complete"