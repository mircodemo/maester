﻿# Description: This script is used to generate the 'Command Reference' section of the Maester docusaurus site
# * This command needs to be run from the root of the project. e.g. ./build/Build-CommandReference.ps1
# * The New-DocusaurusHelp command deletes and recreates the ./docs/docs/commands folder
# * If running the docusaurus site locally you will need to stop and start Docusaurus to clear the 'Module not found' errors after running this command

if (-not (Get-Module Alt3.Docusaurus.Powershell -ListAvailable)) {
    Install-Module Alt3.Docusaurus.Powershell -Scope CurrentUser -Force -SkipPublisherCheck
    Install-Module PlatyPS -Scope CurrentUser -Force -SkipPublisherCheck
}
Import-Module Alt3.Docusaurus.Powershell
Import-Module PlatyPS
New-DocusaurusHelp -Module ./src/Maester.psm1 -DocsFolder ./docs/docs -NoPlaceHolderExamples -EditUrl https://github.com/maester365/maester/blob/main/src/public/

# Update the markdown to include the synopsis as description so it can be displayed correctly in the doc links.

$cmdMarkdownFiles = Get-ChildItem ./docs/docs/commands
foreach ($file in $cmdMarkdownFiles) {
    $content = Get-Content $file
    $synopsis = $content[($content.IndexOf("## SYNOPSIS") + 2)] # Get the synopsis
    $updatedContent = $content.Replace("id:", "sidebar_class_name: hidden`ndescription: $($synopsis)`nid:")
    Set-Content $file $updatedContent
}