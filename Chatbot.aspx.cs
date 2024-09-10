﻿using System;
using System.Linq;
using Newtonsoft.Json.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

public partial class Pages_Chatbot : System.Web.UI.Page
{
    DataClasses_MedicalAppDataContext db = new DataClasses_MedicalAppDataContext("");

    protected async void btnSend_Click(object sender, EventArgs e)
    {
        string userInput = txtUserInput.Text;

        // Call Wit.ai service to get the bot's response
        var witAiService = new WitAiService();
        string response = await witAiService.GetResponseAsync(userInput);

        // Display the bot's response in the label
        lblResponse.Text = ParseWitAiResponse(response);
    }

    private string ParseWitAiResponse(string jsonResponse)
    {
        try
        {
            // Parse the JSON response
            var json = JObject.Parse(jsonResponse);

            //// Extract the intent
            //var intent = json["intents"].FirstOrDefault()["name"].ToString();

            //// Extract the symptom entity (if you have one)
            //var symptom = json["entities"]["symptom"].FirstOrDefault()["value"].ToString();

            //// Generate a response based on the intent and entities
            //if (intent == "MedicalAdviceIntent" && !string.IsNullOrEmpty(symptom))
            //{
            //    return "You mentioned having a {symptom}. I suggest visiting the nearest clinic for medical advice.";
            //}
            //else
            //{
            //    return "I'm not sure how to help with that. Please contact a medical professional.";
            //}
            int index_ = json["traits"].ToString().IndexOf(txtUserInput.Text);

            int index_reply = json["traits"].ToString().Substring(index_).IndexOf("value") ;
            string reply  = json["traits"].ToString().Substring(index_).Substring(index_reply);
            return reply.Substring(0, (reply.Length));
        }
        catch (Exception ex)
        {
            // Handle any errors that occur during parsing
            return "Error parsing response: {ex.Message}";
        }
    }
}