 <div class="row">
            <section><div class="col-lg-3">
		<img alt="Logo" class="img-responsive" src="${logo}"/>
		</div>
                <div class="col-rg-3 col-lg-offset-7">
                     
					<ul class="nav nav-pills">
					  <li role="presentation" class="active"><a href="${home}">Home</a></li>
					 
					  <%  if(session.getAttribute("userName") !=null) { %>
			 				<li> <a href="profile?userName=${userName}">Profile</a></li> 
			 			<% } %>
					  <li role="presentation"><a href="search">Questions</a></li>
					  <li role="presentation"><a href="question">Ask Questions</a></li>
					  <li role="presentation"><a href="unanswered">UnAnswered</li>
					</ul>

                   
                </div>
            </section>
           
        </div>