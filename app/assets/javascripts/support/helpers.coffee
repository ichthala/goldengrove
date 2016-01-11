Goldengrove.helpers =

  is_user_signed_in: (callback, not_signed_in_callback) ->
    $.ajax
      url: '/sessions/signed_in'
      type: 'GET'
      dataType: 'json'
      success: (response) =>
        if response.user_signed_in
          signed_in_callback()
        else
          not_signed_in_callback()
