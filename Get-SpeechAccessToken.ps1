function Get-SpeechAccessToken() {
    <#
.SYNOPSIS
  Gets an Access Token for further API calls to the Speech to Text API
.DESCRIPTION
  Gets an Access Token for further API calls to the Speech to Text API
.PARAMETER SubscriptionKey
  The subscription key for the Cognitive Speech Service object
.PARAMETER RegionCode
  The Azure Region where the Speech Service object resides, ex. "eastus"
#>
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)] [Alias("Key")] [string] $SubscriptionKey,
        [Parameter(Mandatory = $false)] [Alias("RegionCode")] [string] $Region = "eastus"
    )
    $FetchTokenHeader = @{
        'Content-type'              = 'application/x-www-form-urlencoded';
        'Content-Length'            = '0';
        'Ocp-Apim-Subscription-Key' = $SubscriptionKey
    }
      
    $OAuthToken = Invoke-RestMethod -Method POST -Uri https://$Region.api.cognitive.microsoft.com/sts/v1.0/issueToken -Headers $FetchTokenHeader
      
    # show the token received    
    Return $OAuthToken
}