# posh-azspeechtotext
Powershell implementation to batch convert recorded speech files into text

Note, you need a Subscription Key for the Azure Cognitive Services object.  You can get this in the Azure Portal after creating the resource.  The audio file(s) should be converted to an appropriate format prior to submitting to the API, otherwise "no audio" errors may occur.  The RegionCode parameter must must the region code for the Azure Region your resource was created in.

**Example**
```powershell
Import-Module ./Get-SpeechAccessToken.ps1
Import-Module ./Get-SpeechToText

$token = Get-SpeechAccessToken -SubscriptionKey 'key here' -RegionCode 'eastus'
$text = Get-SpeechToText `
    -SubscriptionKey 'key here' `
    -Token $token `
    -Path './path/to/audio.wav' `
    -Region 'eastus' `
    -Language 'en-US' `
```