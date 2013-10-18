﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<string>" %>
<% ViewData.TemplateInfo.HtmlFieldPrefix = ViewData.TemplateInfo.HtmlFieldPrefix.Replace(ViewData.ModelMetadata.PropertyName, "").Trim('.');
   var propertyName = ViewData["name"] == null ? ViewData.ModelMetadata.PropertyName : ViewData["name"].ToString();
   var setting = Kooboo.CMS.Account.Persistence.RepositoryFactory.SettingRepository.Get();
%>
<tr>
    <th>
        <label for="<%:ViewData.TemplateInfo.GetFullHtmlFieldId(propertyName)%>">
            <%: ViewData.ModelMetadata.GetDisplayName().Localize()%></label>
    </th>
    <td>
        <%: Html.Password(propertyName, Model, Html.GetUnobtrusiveValidationAttributes(propertyName, ViewData.ModelMetadata)
                                                                    .Merge("class", ViewData["class"])
                                                                    .Merge("autocomplete", ViewData["autocomplete"] ?? "on")
                                                                    .Merge("data-val-regex-pattern",setting.PasswordStrength)
                                                                    .Merge("data-val-regex", setting.PasswordInvalidMessage)
                                                                    .Merge("data-val","true"))%>
        <%             
            if (!string.IsNullOrEmpty(ViewData.ModelMetadata.Description))
            {%>
        <a href="#" class="tooltip-link" title="<%: ViewData.ModelMetadata.Description.Localize() %>">
        </a>
        <%} %>
        <%: Html.ValidationMessage(ViewData.ModelMetadata, new { name = ViewData["name"] })%>
    </td>
</tr>
