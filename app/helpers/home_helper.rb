# frozen_string_literal: true

# helpers to home view
module HomeHelper
  def premium_label(premium)
    "<div class='is-pulled-right tag is-warning'>Premium</div>".html_safe if premium
  end
end
