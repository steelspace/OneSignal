using System.Diagnostics;
using System.Security;
using OneSignalApi.Api;
using OneSignalApi.Client;
using OneSignalApi.Model;
using System.Text.Json;

public class OneSignalService
{
    DefaultApi api;
    const string appId = "d9740e14-8070-45a8-9c0b-f66dde0a44f1";

    public OneSignalService()
    {
        var appConfig = new Configuration
        {
            BasePath = "https://onesignal.com/api/v1",
            AccessToken = "<HERE>"
        };

        api = new DefaultApi(appConfig);
    }

    public void CreatePlayer(string email)
    {
        var player = new Player();

        // APP needs to be created in the OneSignal admin
        // for us, it should be CMS or Responsive
        player.AppId = appId;

        // we have only anonymous users, so email is the only
        // user ID we have
        player.ExternalUserId = email;
        player.Identifier = email;
        player.DeviceType = 11;
        player.Language = "en";

        try
        {
            CreatePlayerSuccessResponse result = api.CreatePlayer(player);
            Debug.WriteLine(result);
        }
        catch (ApiException e)
        {
            Debug.Print("Exception when calling DefaultApi.CreatePlayer: " + e.Message);
            Debug.Print("Status Code: " + e.ErrorCode);
            Debug.Print(e.StackTrace);
        }
    }

    public void Subscribe(string email, string newsletterTag)
    {
        var tags = new Dictionary<string, string>
        {
            { newsletterTag, "subscribed" }
        };
        // player.Tags = JsonSerializer.Serialize(tags);

        var updatePlayerTagsRequestBody = new UpdatePlayerTagsRequestBody(tags);

        try
        {
            UpdatePlayerTagsSuccessResponse result = api.UpdatePlayerTags(appId, email, updatePlayerTagsRequestBody);
            Debug.WriteLine(result);
        }
        catch (ApiException e)
        {
            Debug.Print("Exception when calling DefaultApi.UpdatePlayerTags: " + e.Message);
            Debug.Print("Status Code: " + e.ErrorCode);
            Debug.Print(e.StackTrace);
        }
    }

    // Define a method to send email using OneSignal
    public void SendEmailToTaggedUsers(string newsletterTag)
    {
        var notification = new Notification(appId: appId);
        var filter = new Filter("tag", newsletterTag, "subscribed", Filter.RelationEnum.Equal);

        notification.Filters = new List<Filter>() { filter };

        try
        {
            // Create notification
            var result = api.CreateNotification(notification);
            Debug.WriteLine(result);
        }
        catch (ApiException e)
        {
            Debug.Print("Exception when calling DefaultApi.CreateNotification: " + e.Message);
            Debug.Print("Status Code: " + e.ErrorCode);
            Debug.Print(e.StackTrace);
        }
    }
}
