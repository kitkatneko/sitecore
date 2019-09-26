$props = @{
   InfoTitle = "Remove Versions"
    PageSize = 10000000
}

$sourcePath =  "master:/sitecore/content/Home/Site1"

function Remove-Versions {

    $items = Get-ChildItem -Path $sourcePath -Recurse
    $rootItem = Get-Item -Path $sourcePath
    $items = $items + $rootItem

    foreach ($item in $items)
    {
        foreach ($version in $item.Versions.GetVersions($true))
        {
            if ($version.Language -ne "en")
            {
                Remove-ItemVersion $version
                Write-Host $version.ID " - " $version.Language "- deleted"
                $version;
            }
        }   
    }

}

$items = Remove-Versions
$items | Show-ListView @props -Property ItemPath, ID, @{Label="Language"; Expression={$_."Language"}} 
Close-Window
