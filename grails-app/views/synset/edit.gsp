<%@page import="com.vionto.vithesaurus.*" %>
<g:javascript library="prototype" />
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title><g:message code='edit.title' args="${[synset.toShortString()]}"/></title>
        <g:if test="${synset?.isVisible == false || params.offset}">
          <meta name="robots" content="noindex" />
        </g:if>
        <script type="text/javascript" src="${createLinkTo(dir:'js/prototype',file:'prototype.js')}"></script>
        <script type="text/javascript">
        <!--

          function deleteItem(id, termId) {
            var hiddenFieldName = 'delete_' + id + '_' + termId;
            var deleted = document.getElementById(hiddenFieldName).value == 'delete';
            var divName = id + '_' + termId;
            if (deleted) {
              document.getElementById(hiddenFieldName).value = '';
              document.getElementById(divName).style.textDecoration = '';
            } else {
              document.getElementById(hiddenFieldName).value = 'delete';
              document.getElementById(divName).style.textDecoration = 'line-through';
            }
            return false;
          }

          <g:render template="completion"/>


          // TODO: use dojo for this?!
          // TODO: avoid scroll jumping on click
          function showNewTerm() {
            document.getElementById('newTermLink').style.display='none';
            document.getElementById('newTerm').style.display='block';
            document.editForm.word_0.focus();
            return false;
          }

          function showNewCategory() {
            document.getElementById('newCategoryLink').style.display='none';
            document.getElementById('newCategory').style.display='block';
            return false;
          }

          function showChangeCategory() {
            document.getElementById('changeCategoryLink').style.display='none';
            document.getElementById('newCategory').style.display='block';
            return false;
          }

          function showNewSynsetLink(linkType) {
            document.getElementById('addSynsetLink-' + linkType).style.display='none';
            document.getElementById('addSynset-' + linkType).style.display='block';
            document.editForm["q" + linkType].focus();
            return false;
          }

          function showAddComment() {
            document.getElementById('addCommentLink').style.display='none';
            document.getElementById('addComment').style.display='block';
            document.editForm.userComment.focus();
            return false;
          }

          function toggleId(divId) {
            if (document.getElementById(divId).style.display == 'block') {
                document.getElementById(divId).style.display='none';
             } else {
                document.getElementById(divId).style.display='block';
             }
          }

        // -->
        </script>
    </head>
    <body>

        <hr />

        <h1 style="margin-bottom:12px"><g:message code='edit.headline' args="${[synset.toShortString()]}"/></h1>

        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>

        <g:hasErrors bean="${synset}">
        <div class="error">
            <g:renderErrors bean="${synset}" as="list" />
        </div>
        </g:hasErrors>

        <g:hasErrors bean="${newTerm}">
        <div class="error">
            <g:renderErrors bean="${newTerm}" as="list" />
        </div>
        </g:hasErrors>

        <g:if test="${!synset?.isVisible}">
            <div class="warning"><g:message code='edit.invisible'/></div>
        </g:if>

        <g:if test="${!session.user}">
            <g:set var="disabled" value="disabled='true'"/>
        </g:if>

        <g:form controller="synset" method="post" name="editForm">
            <input type="hidden" name="id" value="${synset?.id}" />
            <input type="hidden" name="synset.id" value="${synset?.id}" />
            <div class="dialog">
                <table>
                    <tbody>
                        <tr class='prop'>
                            <td valign='top' class='name'>
                                <h2 class="noTopMargin"><g:message code='edit.terms'/></h2>
                            </td>
                            <td valign='top' class='value ${hasErrors(bean:synset,field:'terms','errors')}'>

                            <ul style="margin-top:0px">
                                <g:set var="previousLanguage" value=""/>
                                <g:each var='t' in='${synset?.sortedTerms()}'>
                                    <li class="checkboxList">
                                        <g:if test="${previousLanguage != '' && t.language != previousLanguage}">
                                            <br/>
                                        </g:if>
                                        <input type="hidden" id="delete_termId_${t.id}" name="delete_${t.id}" value=""/>

                                        <div id="termId_${t.id}">

                                            <g:if test="${session.user}">
                                              <a href="#" onclick="deleteItem('termId', '${t.id}');return false;"><img
                                                align="top" src="${resource(dir:'images',file:'delete2.png')}" alt="delete icon" title="${message(code:'edit.select.to.delete')}"/></a>
                                            </g:if>
                                            <g:else>
                                              <img align="top" src="${resource(dir:'images',file:'delete2_inactive.png')}" alt="delete icon"/>
                                            </g:else>

                                            <g:link class="termMetaInfo otherMeaningSearchLink" controller='term' action='edit' id='${t.id}'>
                                                [<g:message code='edit.edit.term'/>]</g:link>

                                            <strong>${t.toString()?.encodeAsHTML()}</strong>

                                            <g:if test="${t.isAcronym}">
                                                <span class="termMetaInfo">[<g:message code='edit.acronym'/>]</span>
                                            </g:if>
                                            <g:if test="${t.isShortForm}">
                                                <span class="termMetaInfo">[<g:message code='edit.shortform'/>]</span>
                                            </g:if>
                                            <g:if test="${t.level}">
                                                <span class="termMetaInfo">${t.level.toString()?.encodeAsHTML()}</span>
                                            </g:if>
                                            <g:if test="${t.wordGrammar && t.wordGrammar.form != 'undefined'}">
                                                <span class="termMetaInfo">[${t.wordGrammar.toString()?.encodeAsHTML()}]</span>
                                            </g:if>
                                            <g:set var="termCount" value="${t.listHomonyms().size()}"/>

                                            <g:link title="${message(code:'edit.find.all.meanings', args: [t.word.encodeAsHTML()])}"
                                                class="termMetaInfo otherMeaningSearchLink" action="search" params="[q : t.word]">[${termCount}]</g:link>

                                        </div>

                                        <g:if test="${t.userComment}">
                                            <div style="margin-left: 22px">
                                                <span class="termMetaInfo">${t.userComment?.encodeAsHTML()}</span>
                                            </div>
                                        </g:if>

                                        <g:set var="previousLanguage" value="${t.language}"/>

                                        <g:set var="termLinkInfos" value="${t.termLinkInfos()}"/>
                                        <g:if test="${termLinkInfos.size() > 0}">
                                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                          <g:each var='termLinkInfo' in='${termLinkInfos}'>
                                            ${termLinkInfo.getLinkName().encodeAsHTML()}: <g:link controller="synset"
                                                action="edit" id="${termLinkInfo.getTerm2().synset.id}">${termLinkInfo.getTerm2().encodeAsHTML()}</g:link>
                                          </g:each>
                                        </g:if>

                                    </li>
                                </g:each>

                                <li class="checkboxList" style="margin-top:10px">
                                  <g:if test="${session.user}">
                                    <div id="newTermLink">
                                        <a href="#" onclick="javascript:showNewTerm();return false;"><img align="top" src="${createLinkTo(dir:'images',file:'plus.png')}" alt="Plus"/>&nbsp;<g:message code='edit.add.terms'/></a>
                                    </div>

                                    <% int i = 0; %>
                                    <div id="newTerm" style="display:none">
                                        <g:while test="${i < Integer.parseInt(grailsApplication.config.thesaurus.maxNewTerms)}">
                                            <g:message code="edit.term.term"/>: <input onkeypress="return avoidSubmitOnReturn(event);"
                                                class="termInput" spellcheck="true" name="word_${i}" value="${params['word_'+i]}" />&nbsp;
                                            <g:if test="${Language.findAllByIsDisabled(false)?.size() == 1}">
                                                <g:hiddenField name="language.id_${i}" value="${Language.findByIsDisabled(false).id}"/>
                                            </g:if>
                                            <g:else>
                                                <g:select class="submitButton" name="language.id_${i}" optionKey="id" from="${Language.list()}" />&nbsp;
                                            </g:else>
                                            <g:message code="edit.term.level"/>: <g:select class="submitButton" name="level.id_${i}" optionKey="id" noSelection="['null':'-']" from="${TermLevel.list()}" />&nbsp;
                                            <g:if test="${i == 0}">
                                                <a href="#" onclick="javascript:toggleId('languageLevelHelp');return false;">[?]</a>
                                                <div id="languageLevelHelp" style="display: none">
                                                    <g:render template="languageLevelHelp" />
                                                </div>
                                            </g:if>
                                            <% i++ %>
                                            <br />
                                        </g:while>
                                    </div>
                                  </g:if>
                                </li>
                            </ul>

                            </td>
                        </tr>
                        <tr><td></td></tr>

                        <tr class='prop'>
                            <td valign='top' class='name'>
                                <h2 class="noTopMargin"><g:message code='edit.categories'/></h2>
                            </td>
                            <td valign='top' class='value ${hasErrors(bean:synset,field:'synsetLinks','errors')}'>

                            <g:if test="${synset.categoryLinks.size() == 0 && !session.user}">
                                <span class="noMatches"><g:message code="edit.not.set"/></span>
                            </g:if>
                            <ul style="margin-top:0px">
                                <g:if test="${synset.categoryLinks.size() > 0}">
                                  <g:each var='catLink' in='${synset.categoryLinks.sort()}'>
                                      <li class="checkboxList">

                                        <input type="hidden" id="delete_catLinkId_${catLink.id}" name="delete_catLinkId_${catLink.id}" value=""/>
                                        <div id="catLinkId_${catLink.id}">

                                            <g:if test="${session.user}">
                                              <a href="#" onclick="deleteItem('catLinkId', '${catLink.id}');return false;"><img
                                                align="top" src="${resource(dir:'images',file:'delete2.png')}" alt="delete icon" title="${message(code:'edit.select.to.delete.category')}"/></a>
                                            </g:if>
                                            <g:else>
                                              <img align="top" src="${resource(dir:'images',file:'delete2_inactive.png')}" alt="delete icon"/>
                                            </g:else>

                                            ${catLink.category}
                                            <g:link controller="term" action="list" params="${[categoryId:catLink.category.id]}"><g:message code="edit.show.category.terms"/></g:link>
                                            <g:if test="${catLink.category.categoryType}">
                                                   <span class="termMetaInfo">[${catLink.category.categoryType}]</span>
                                            </g:if>
                                        </div>
                                      </li>
                                  </g:each>

                                </g:if>

                                  <li class="checkboxList" ${synset.categoryLinks.size() > 0 ? 'style="margin-top:10px"' : ''}>
                                    <g:if test="${session.user}">
                                         <%-- Change or add new category --%>
                                         <div id="newCategoryLink">
                                             <a href="#" onclick="javascript:showNewCategory();return false;"><img align="top" src="${createLinkTo(dir:'images',file:'plus.png')}" alt="Plus"/>&nbsp;<g:message code='edit.add.categories'/></a>
                                         </div>

                                         <div id="newCategory" style="display:none">
                                             <% i = 0; %>
                                             <g:while test="${i < Integer.parseInt(grailsApplication.config.thesaurus.maxNewCategories)}">
                                                 <select class="submitButton" name="category.id_${i}" id="category.id_${i}" >
                                                    <option value="null"><g:message code='edit.no.further.category'/></option>
                                                    <g:each var="category" in="${Category.findAllByIsDisabled(false, [sort:'categoryName'])}">
                                                        <option value="${category.id}">${category.toString()?.encodeAsHTML()}
                                                            <g:if test="${category.categoryType}">
                                                                [${category.categoryType}]
                                                            </g:if>
                                                        </option>
                                                    </g:each>
                                                 </select>
                                                 <br />
                                                 <% i++ %>
                                             </g:while>
                                         </div>
                                     </g:if>
                                  </li>

                            </ul>

                            </td>
                        </tr>
                        <tr><td></td></tr>

                        <g:if test="${LinkType.count() > 0}">

                            <g:set var="synsetLinks" value="${synset?.sortedSynsetLinks()}"/>

                            <%
                            Set displayedSynsets = new HashSet()
                            %>
                            <g:render template="link" model="[title:message(code:'edit.link.preambles'), linkTypeName:message(code:'edit.link.preambles'),
                                synset:synset, synsetLinks:synsetLinks, showAddLink:true, displayedSynsets: displayedSynsets]" />

                            <g:render template="link" model="[title:message(code:'edit.link.terms'), linkTypeName:message(code:'edit.link.terms'),
                                synset:synset, synsetLinks:synsetLinks, showAddLink:false, displayedSynsets: displayedSynsets,
                                reverseLink:true]" />

                            <g:render template="link" model="[title:message(code:'edit.link.associations'), linkTypeName:message(code:'edit.link.associations'),
                                synset:synset, synsetLinks:synsetLinks, showAddLink:true, displayedSynsets: displayedSynsets]" />

                        </g:if>

                        <g:if test="${session.user}">
                            <tr class='prop'>
                                <td class='name' valign="top">
                                    <h2 class="noTopMargin"><g:message code='edit.delete'/></h2>
                                </td>
                                <td valign='top'>
                                    <div class="buttons">
                                        <g:if test="${synset.isVisible}">
                                            <a href="javascript:toggleId('deleteButton')">${message(code:'edit.delete.button')}</a>
                                            <div id="deleteButton" style="display:${showOnlyDeleteButton ? 'block' : 'none'};margin-top:12px">
                                                <g:actionSubmit style="background-color: #ff9790" action="hide" class="hide submitButton" value="${message(code:'edit.delete.now.button')}" />
                                            </div>
                                        </g:if>
                                        <g:else>
                                            <g:actionSubmit action="unhide" class="unhide submitButton" value="${message(code:'edit.undelete.button')}" />
                                        </g:else>
                                    </div>
                                </td>
                            </tr>
                        </g:if>

                        <g:if test="${session.user}">
                              <tr class='prop'>
                                  <td valign='top' class='name'>
                                     <h2 class="noTopMargin" style="margin-bottom: 0px;"><g:message code='edit.comment.for.change'/></h2>
                                     <g:message code='edit.comment.for.change.detail'/>
                                  </td>
                                  <td valign='top' class='value'>
                                      <input ${disabled} onkeypress="return avoidSubmitOnReturn(event);" size="40"
                                           id="changeComment" spellcheck="true" type="text" name="changeComment" value="" />
                                  </td>
                              </tr>

                              <tr>
                                <td></td>
                                <td>
                                    <g:if test="${!showOnlyDeleteButton && synset?.isVisible}">
                                        <div class="buttons">
                                            <g:actionSubmit action="update" class="save submitButton" value="${message(code:'edit.submit')}" />
                                        </div>
                                    </g:if>
                                </td>
                              </tr>
                        </g:if>

                        <tr>
                            <td></td>
                            <td>
                                <g:if test="${!session.user}">
                                      <g:link controller="user" action="login" class="link"
                                            params="${linkParams}"><img align="top" src="${createLinkTo(dir:'images',file:'forum-bubble.png')}" alt="Forum-Icon" /> <g:message code='edit.login.to.improve'/> </g:link>
                                </g:if>
                                <br/>
                                <g:render template="forumlink" />
                            </td>
                        </tr>

                    </tbody>
                </table>

            </div>

        </g:form>

        <g:if test="${eventList}">
            <!-- is not always set, e.g. after error -->
            <div class="colspanlist">

              <br />
              <h2><a name="history"><g:message code='edit.latest.changes' args="${[eventListCount]}"/></a></h2>

              <table>
                  <tr>
                      <th><g:message code='edit.changelog.date'/></th>
                      <th style="min-width: 55px"><g:message code='edit.changelog.user'/></th>
                      <th><g:message code='edit.changelog.change'/></th>
                      <th><g:message code='edit.changelog.comment'/></th>
                  </tr>
                  <g:each var='event' in='${eventList}' status='i'>
                      <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                          <td valign="top" width="110">
                              <g:formatDate format="yyyy-MM-dd" date="${event.creationDate}"/>
                              <span class="metaInfo"><g:formatDate format="HH:mm" date="${event.creationDate}"/></span>
                          </td>
                          <td valign="top">
                              <g:link controller="user" action="profile" params="${[uid:event.byUser.id]}">
                                  <g:if test="${event.byUser.realName}">
                                      ${event.byUser.realName.encodeAsHTML()}
                                  </g:if>
                                  <g:else>
                                      <span class="anonUserId">#${event.byUser.id}</span>
                                  </g:else>
                              </g:link>
                          </td>
                          <td valign="top">${diffs.get(event)
                                  .replaceAll("linking:", " <span class='add'>verlinkt:</span> ")
                                  .replaceAll("adding link:", " <span class='add'>verlinkt:</span> ")
                                  .replaceAll("(deleting|removing) link:", " <span class='del'>Link entfernt:</span> ")
                                  .replaceAll("ist das Antonym von", " <b>ist das Antonym von</b> ")
                                  .replaceAll(" assoziiert ", " <b>assoziiert</b> ")
                                  .replaceAll(" ist ein Oberbegriff von ", " <b>ist ein Oberbegriff von</b> ")}</td>
                          <td valign="top">${event.changeDesc?.encodeAsHTML()}</td>
                      </tr>
                  </g:each>
              </table>

              <div class="paginateButtons">
                  <g:paginate fragment="history" total="${eventListCount}" id="${params.id}" />
              </div>

            </div>
        </g:if>

        <g:render template="/ads/edit_bottom"/>

    </body>
</html>
