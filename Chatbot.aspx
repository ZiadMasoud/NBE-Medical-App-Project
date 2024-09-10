<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Employee.master" Async="true" AutoEventWireup="true" CodeFile="Chatbot.aspx.cs" Inherits="Pages_Chatbot" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="Server">
    <asp:Label ID="lblSearchQuestion" runat="server"  Text="Ask a Question"></asp:Label>
    <asp:TextBox ID="txtUserInput" CssClass="form-control mb-3" runat="server"></asp:TextBox>
    <asp:Button ID="btnSend" runat="server" Text="Send" CssClass="btn btn-primary w-25" OnClick="btnSend_Click" />
    <asp:Label ID="lblResponse" runat="server" Text=""></asp:Label>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Script" runat="Server">
</asp:Content>
