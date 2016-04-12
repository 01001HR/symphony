<#include "macro-head.ftl">
<!DOCTYPE html>
<html>
    <head>
        <@head title="${chatRoomLabel} - ${symphonyLabel}">
        <meta name="description" content="${timelineLabel}"/>
        </@head>
        <link type="text/css" rel="stylesheet" href="${staticServePath}/css/index${miniPostfix}.css?${staticResourceVersion}" />
        <link rel="stylesheet" href="${staticServePath}/js/lib/editor/codemirror.css">
    </head>
    <body>
        <#include "header.ftl">
        <div class="main">
            <div class="wrapper">
                <div class="content">
                    <h2>${chatRoomLabel}</h2><br/>
                    <div class="list">
                        <ul>
                            <#list messages as msg>
                            <li>
                                <div class="fn-flex">
                                    <a rel="nofollow" href="/member/${msg.userName}">
                                        <div class="avatar" 
                                             title="${msg.userName}" style="background-image:url('{comment.commentAuthorThumbnailURL}-64.jpg?{comment.commenter.userUpdateTime?c}')"></div>
                                    </a>
                                    <div class="fn-flex-1">
                                        <div class="fn-clear">
                                            <span class="fn-left">
                                                <a rel="nofollow" href="/member/${msg.userName}"
                                                   title="${msg.userName}">${msg.userName}</a>
                                            </span>
                                        </div>
                                        <div class="content-reset">
                                            ${msg.content}
                                        </div>
                                    </div>
                                </div>
                            </li>
                            </#list>  
                        </ul>
                    </div>

                    <#if isLoggedIn>
                    <textarea id="chatContent" rows="10" placeholder="reply...."></textarea>
                    <div class="tip" id="chatContentTip"></div>
                    <div class="fn-clear comment-submit">
                        <span class="responsive-hide">    
                            Markdown
                            <a href="javascript:void(0)" onclick="$('.grammar').slideToggle()">${baseGrammarLabel}</a>
                            <a target="_blank" href="http://daringfireball.net/projects/markdown/syntax">${allGrammarLabel}</a>
                            |
                            <a target="_blank" href="${servePath}/emoji/index.html">Emoji</a>
                        </span>
                        <div class="fn-right">
                            <button class="red" onclick="ChatRoom.send()">${postLabel}</button>
                        </div>
                    </div>
                    <#else>
                    <div class="comment-login">
                        <a rel="nofollow" href="javascript:window.scrollTo(0,0);Util.showLogin();">${loginDiscussLabel}</a>
                    </div>
                    </#if>

                </div>
                <div class="side">
                    <#include "side.ftl">
                </div>
            </div>
        </div>
        <#include "footer.ftl">
        <script>
            Label.uploadLabel = "${uploadLabel}";
        </script>
        <script type="text/javascript" src="${staticServePath}/js/lib/ws-flash/swfobject.js"></script>
        <script type="text/javascript" src="${staticServePath}/js/lib/ws-flash/web_socket.js"></script>
        <script type="text/javascript" src="${staticServePath}/js/lib/reconnecting-websocket.min.js"></script>
        <script src="${staticServePath}/js/lib/editor/codemirror.min.js?5120"></script>
        <script src="${staticServePath}/js/lib/editor/editor.js?${staticResourceVersion}"></script>
        <script type="text/javascript" src="${staticServePath}/js/lib/highlight.js-8.6/highlight.pack.js"></script>
        <script type="text/javascript" src="${staticServePath}/js/lib/jquery/file-upload-9.10.1/jquery.fileupload.min.js"></script>
        <script type="text/javascript" src="${staticServePath}/js/channel${miniPostfix}.js?${staticResourceVersion}"></script>
        <script type="text/javascript" src="${staticServePath}/js/chat-room${miniPostfix}.js?${staticResourceVersion}"></script>
        <script>
            WEB_SOCKET_SWF_LOCATION = "${staticServePath}/js/lib/ws-flash/WebSocketMain.swf";
            // Init [ChatRoom] channel
            ChatRoomChannel.init("${wsScheme}://${serverHost}:${serverPort}/chat-room-channel");

            var chatRoomMsgCnt = ${
                chatRoomMsgCnt
            }
            ;
            Util.uploadFile({
                "type": "img",
                "id": "fileUpload",
                "pasteZone": $(".CodeMirror"),
                "editor": ChatRoom.editor,
                "qiniuUploadToken": "${qiniuUploadToken}",
                "uploadingLabel": "${uploadingLabel}",
                "qiniuDomain": "${qiniuDomain}"
            });
        </script>
    </body>
</html>