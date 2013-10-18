﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%
    var action = ViewContext.RequestContext.GetRequestValue("action").ToLower();
    var IsNew = action == "create";
%>
<ul class="step clearfix">
    <li class=" <%:action=="create"||action=="edit" ?"current":""%>">
        <%if (IsNew || action == "create" || action == "edit")
          {%>
        <%if (IsNew)
          { %><%="Create".Localize() %>
        <%}

          else
          {%><%="Edit".Localize() %>
        <% } %>
        <% }
          else
          { %>
        <%:Html.ActionLink("Edit".Localize(),"Edit", ViewContext.RequestContext.AllRouteValues())%>
        <%}%>
    </li>
    <%if (Kooboo.CMS.Content.Models.Repository.Current.EnableCustomTemplate)
      {%>
    <li class="separator">&gt;</li>
    <li class=" <%:action=="templates"?"current":"" %>">
        <%if (IsNew || action == "templates")
          {%>
        <%="Templates".Localize()%>
        <% }
          else
          {%>
        <%:Html.ActionLink("Templates".Localize(), "Templates", ViewContext.RequestContext.AllRouteValues())%>
        <% } %>
    </li>
    <%} %>
</ul>
