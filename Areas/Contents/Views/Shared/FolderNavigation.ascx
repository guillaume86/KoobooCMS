﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%var routes = ViewContext.RequestContext.AllRouteValues();
  routes["fullName"]= Request["fullName"];
%>
<%: Html.ActionLink("Create Text Folder".Localize(), "CreateTextFolder", "Folder", routes, new RouteValueDictionary(new { @class = "button" }))%>
<%: Html.ActionLink("Create Binary Folder".Localize(), "CreateBinaryFolder", "Folder", routes, new RouteValueDictionary(new { @class = "button" }))%>
