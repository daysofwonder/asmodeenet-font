
File.open('./index.html', 'w') do |f|
    f << '<xhtml><head><link href="./css/anet-webfont.css" type="text/css" rel="stylesheet">' \
         '<title>AsmodeeNet Webfont</title>' \
         '<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">' \
         '<link href="./css/webfont-anet-doc.css" type="text/css" rel="stylesheet">' \
         '<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>' \
         '<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>' \
         '<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>' \
         '</head><body><div class="container"><h1>AsmodeeNet Webfont</h1>' \
         '<ul class="nav nav-pills" role="tablist">' \
         '<li class="nav-item"><a class="nav-link active" id="grid-tab" data-toggle="tab" href="#grid">Grid</a></li>' \
         '<li class="nav-item"><a class="nav-link" id="list-tab" data-toggle="tab" href="#list">List</a></li>' \
         '<li class="nav-item"><a class="nav-link" id="incode-tab" data-toggle="tab" href="#incode">Code</a></li></ul>' \
         '<div class="tab-content">' \
         '<div class="tab-pane fade show active" id="grid" role="tabpanel"><table class="table table-bordered gridlist">'

     grid = '</table></div>' \
         '<div class="modal fade" id="iconModal" tabindex="-1" role="dialog" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="iconModalLabel"></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                  <div class="container">
                    <div style="font-size: 14px;">
                        <i class="icon fanet" style="font-size:6em;"></i>
                        <i class="icon fanet" style="font-size:5em;"></i>
                        <i class="icon fanet" style="font-size:3em;"></i>
                        <i class="icon fanet" style="font-size:2em;"></i>
                        <i class="icon fanet"></i>
                      </div>
                      <hr/>
                      <div>
                        <p>Unicode: U+ <label id="uni"></label></p>
                        CSS code: <pre id="css"></pre><br/><br/>
                        <p><code class="hcode"></code></p>
                      </div>
                      <hr/>
                      <div id="styled">

                      </div>
                 </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
              </div>
            </div>
          </div>
        </div>' \
         '<div class="tab-pane fade" id="list" role="tabpanel">' \
         '<div class="row"><div class="col-md-12">' \
         '<table class="table table-responsive table-striped table-bordered table-responsive">' \
         '<thead><tr><th>Name</th><th>Icon</th><th>CSS class</th><th>Unicode</th></tr></thead><tbody>'

    h = 0xf000;
    i = 0
    %w[
        anet-achievements anet-advanced-online-game anet-aroundMe-game anet-boardgames anet-bot-swap-off anet-bot-swap-on
        anet-broken-link anet-buddies anet-chat-emoticons anet-chat-history anet-chat-sentences anet-chat anet-core-expert-games
        anet-credits anet-family-games anet-featured-games anet-first-player anet-forum anet-full-screen anet-game-log anet-ignored
        anet-invite-online-game anet-join-game anet-leaderboards anet-local-game anet-log-access_colored anet-log-access
        anet-more-game anet-music anet-new-game anet-news anet-not-observable anet-not-ranked
        anet-observable-buddies-only-hand-not-visible anet-observable-buddies-only-hand-visible anet-observable-buddies-only
        anet-observable-everybody-hand-not-visible anet-observable-everybody-hand-visible anet-observable-everybody
        anet-observe-game anet-online-game anet-play-local anet-play-online anet-play anet-player-bot anet-player-clock
        anet-player-human anet-player-karma anet-player-random anet-player-unknown anet-players anet-private anet-public
        anet-quick-online-game anet-quit anet-ranked anet-recent-players anet-rematch anet-results anet-resume-game anet-rules
        anet-search anet-settings anet-share anet-shop anet-sound anet-speed anet-support anet-tutoriel
    ].each do |css|
        vn = css.sub('anet-', '').capitalize.tr('-', ' ')
        uni = ('%x' % h).upcase
        f << '<tr>' if i.zero?
        f << "<td><a data-toggle=\"modal\" data-target=\"#iconModal\" data-name=\"#{vn}\"" \
             " data-code=\"#{css}\" data-uni=\"#{uni}\" href=\"#\">" \
             "<i class=\"fanet #{css}\"></i>#{vn}</a></td>"
        if i == 3
            f << '</tr>'
            i = 0
        else
            i += 1
        end
        grid << "<tr><td>#{vn}</td><td><i class=\"fanet #{css}\"></i></td>" \
                "<td><pre>#{css}</pre></td><td>U+ #{uni}</td></tr>"
        h += 1
    end

    f << grid << '</tbody></table><script>' \
                 '$(\'#iconModal\').on(\'show.bs.modal\', function (event) { var button = $(event.relatedTarget); ' \
                 'var name = button.data(\'name\'); var code = button.data(\'code\'); var uni = button.data(\'uni\');' \
                 'var modal = $(this);' \
                 'modal.find(\'.modal-title\').html("Description of <b>"+name+"</b>");' \
                 'var icons = modal.find(\'.modal-body .icon.fanet\'); icons.removeClass();' \
                 'console.log(icons);' \
                 'icons.addClass(\'icon fanet \'+code);' \
                 'modal.find(\'.modal-body #uni\').text(uni);' \
                 'modal.find(\'.modal-body #css\').text(code);' \
                 'modal.find(\'code\').text(\'<i class="fanet \'+code+\'"></i>\');' \
                 'modal.find(\'#styled\').html(\'<i class="fanet text-danger \'+code+\'"></i>&nbsp;<i class="fanet text-warning \'+code+\'"></i>&nbsp;<i class="fanet text-success \'+code+\'"></i>\');' \
                 '});' \
                 '</script></div></div></div>' \
                  '<div class="tab-pane fade" id="incode" role="tabpanel">' \
                  '<div class="container">' \
                  '<h4>CSS injection</h4>' \
                  '<pre><code class="hcode">' \
                  '&lt;link href="/css/anet-webfont.css" type="text/css" rel="stylesheet"&gt;' \
                  '</code></pre>' \
                  '<h4>CSS usage</h4>' \
                  '<pre><code class="hcode">' \
                  '&lt;i class="fanet anet-buddies"&gt;&lt;/i&gt;' \
                  '</code></pre>' \
                  '<p>AsmodeeNet Webfont classes are compatible with Bootstrap or Font Awesome classes</p>' \
                  '<pre><code class="hcode">' \
                  '&lt;i class="fa fanet anet-buddies fa-5"&gt;&lt;/i&gt;' \
                  '</code></pre>' \
                  '<h4>Available formats</h4>' \
                  '<ul><li>./fonts/anet-webfont.svg</li><li>./fonts/anet-webfont.woff</li><li>./fonts/anet-webfont.eot</li>' \
                  '<li>./fonts/anet-webfont.woff2</li><li>./fonts/anet-webfont.otf</li><li>./fonts/anet-webfont.ttf</li></ul>' \
                  '</div>' \
                  '</div></div></body></xhtml>'
end
