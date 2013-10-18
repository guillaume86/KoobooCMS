﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/Sites/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage<Kooboo.CMS.Sites.Models.View>" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    <%:"Edit view".Localize() %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%
        var model = Kooboo.CMS.Web.Models.ModelHelper.ParseViewData<Kooboo.CMS.Sites.Models.View>(Model);
    %>
    <h3 class="title">
        <%:"Edit view".Localize() %><%:Html.ActionLink("Back to list".Localize(),"Index",ViewContext.RequestContext.AllRouteValues()) %></h3>
    <%ViewContext.RequestContext.AllRouteValues()["prevController"] = ViewContext.RequestContext.AllRouteValues()["controller"]; %>
    <div class="common-form" id="datarule-mainform">
        <% using (Html.BeginForm())
           { %>
        <%:Html.ValidationSummary(true) %>
        <%: Html.HiddenFor(m=>m.EngineName) %>
        <%:Html.Hidden("SiteName",ViewContext.RequestContext.GetRequestValue("SiteName")) %>
        <%: Html.Hidden("old_Key", Model.Name)%>
        <fieldset>
            <legend></legend>
            <table>
                <tbody>
                    <%:Html.DisplayFor(m=>m.Name) %>
                </tbody>
            </table>
            <table>
                <tbody>
                    <%:Html.Partial("TemplateEditor",model) %>
                </tbody>
            </table>
        </fieldset>
        <p class="buttons">
            <button type="submit" name="pageRedirect" value="false">
                <%:"Save".Localize() %></button>
            <button type="submit" name="pageRedirect" value="true">
                <%:"Save & return".Localize() %></button>
        </p>
        <% } %>
    </div>
    <%:Html.Partial("View.Script") %>
    <%if (!string.IsNullOrEmpty(Kooboo.CMS.Sites.Models.Site.Current.Repository))
      {%>
    <div id="DataRuleStep1Div" style="display: none;">
        <%:Html.Partial("DataRuleStep1", ViewData["FolderTree"])%>
    </div>
    <div id="DataRuleStep2Div" style="display: none">
        <%:Html.Partial("DataRuleStep2",new Kooboo.CMS.Sites.Models.DataRuleSetting()) %>
    </div>
    <div id="grid-form-container">
        <%:Html.Partial("DataRuleGridForms",model.DataRules==null? new List<Kooboo.CMS.Sites.Models.DataRuleSetting>():model.DataRules) %>
    </div>
    <%} %>
</asp:Content>
