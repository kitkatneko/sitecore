# Sitecore PowerShell script to remove all language versions except one
a Sitecore PowerShell script to remove all lang versions except one for items under a Sitecore node recursively.

n some cases you may want to remove versions of an item or an entire node in all languages except one or few languages. In that case it is difficult to remove them manually. Instead if we can use a PowerShell script in Sitecore, it would make our job very easy.

Steps:
*  Retrieve all the child items recursively. Include the root item too.
*  For each item, get all the versions in all languages.
*  Check if the language version retrieved is the one you want to remove.If so, use the Remove-ItemVersion to remove that particular version.
