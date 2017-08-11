<div class="row">
    <div id="pagePanel">
         
        <div id="homePanel" class="<% if $FullWidthPage %> fullWidthLayout<% end_if %>">
            <% if Slides %>
            <div id="sliderBox" class="desktop<% if $NoMargin %> noMargins<% end_if %>">
                <div class="content">
                    <div class="flexslider loading">
                      <ul class="slides">
                        <% loop Slides %>
                            <li>
                                <img src="$SlideImage.CroppedImage(600,484).URL" alt="$Title" title="$Title" />
                                <p class="flex-caption">
                                    <span>$Title</span>$Description
                                    <% if $PageID || $ExternalLink %>
                                        <% if $PageID %>
                                            <% with $Page %><a href="$Link">Read more</a><% end_with %>
                                        <% else %>
                                            <a href="$ExternalLink" target="_blank">Read more</a>
                                        <% end_if %>
                                    <% end_if %>
                                </p>
                            </li>
                        <% end_loop %>
                      </ul>
                    </div>
                </div>
            </div>
            <% end_if %>
            <% if $Boxes %>
            <div id="boxWrapper" class="<% if $NoMargin %>noMargins<% end_if %>">
            <% loop $Boxes %>
                <div class="box $Colour pos-$Pos <% if $Pos > 4 %>secondRow<% end_if %>">
                    <div class="content">
                        <% if $HTMLSnippet %>
                        <div class="videoWrapper">
                            >--$HTMLSnippet--<
                        </div>
                        <% else %>
                            <% if $Page.ID > 0 %>
                            <a href="$Page.Link">
                            <% else %>
                            <a href="$ExternalLink" target="_blank">
                            <% end_if %>

                            <% if $BoxImageID %>
                                <img src="$BoxImage.CroppedImage(520,420).URL" alt="$Title" title="$Title" />
                            <% end_if %>
                            <div class="boxText<% if $TextPosition %> $TextPosition<% end_if %><% if $DropShadow %> textShadow<% end_if %><% if $TextColour %> $TextColour<% end_if %>">
                            <h2 class="$TextColour">$Title</h2>
                            <p class="$TextColour">$Description</p>
                            </div>
                           </a>
                       <% end_if %>
                    </div>
                </div>
            <% end_loop %>
            </div>
            <% end_if %>

            <div id="sliderHomeContent">
                $Content
            </div>

        </div> 
        <%-- --------------------news and events under the boxes and content------------------------- --%>

        <div id="boxUnderPanel" class="clearFix">
            <% if $Events && not $HideEvents %>
            <div id="events">
                <h2>Events</h2>
                <% include EventListForHomePage %>
                <a class="clearFix readMore" href="$EventsHolder.Link">See all events</a>
            </div>
            <% end_if %>

            <% if $News && not $HideNews %>
            <div id="news">
                <h2>News</h2>
                <% loop $News %>
                <div class="feature $FirstLast">
                    <a href="$Link"><h3>$Title</h3></a>
                    <p>$Content.FirstSentence</p>
                </div>
                <% if $First %>
                    <% if MainImageID %>
                        <div class="imgWrapper">
                        <% with $MainImage %>
                            <img class="featureImg" src="$CroppedImage(600,260).URL" alt="$Title" />
                        <% end_with %>                    
                        </div>
                    <% else %>
                        <div class="iHateSpacers"></div>
                    <% end_if %>
                <% end_if %>                    
                <% end_loop %>
                <a class="clearFix readMore" href="$NewsHolder.Link">See all news</a>
            </div>
            <% end_if %>
            <div id="homeWidgets">
                <% include ImageLinks %>
                 $MyWidgetArea
            </div>
        </div>

    </div>
</div>

<% require javascript(mysite/javascript/jquery.flexslider-min.js) %>
<% require javascript(mysite/javascript/flex_init.js) %>

<% require css(box_homepage/css/flexsliderbox.css) %>
<% require css(box_homepage/css/slideboxhomepage.css) %>


