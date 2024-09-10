using System.Net.Http;
using System.Threading.Tasks;

public class WitAiService
{
    private static readonly string _witAiToken = "GS4UUNBIRODYCZURFUJJZNEBJ2XCHSBS";
    private static readonly string _witAiApiUrl = "https://api.wit.ai/message?v=20230320&q=";
    
    public async Task<string> GetResponseAsync(string userInput)
    {
        using (var client = new HttpClient())
        {
            client.DefaultRequestHeaders.Add("Authorization", "Bearer " + _witAiToken);
            var response = await client.GetAsync(_witAiApiUrl + userInput);
            return await response.Content.ReadAsStringAsync();
        }
    }
}
