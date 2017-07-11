jQuery ->
  set_select2_ajax= (field)->
    $(field).select2({
      ajax: {
        url: $(field).data("url"),
        dataType: 'json',
        delay: 250,
        cache: true,
        data: (params)->
          return {
            q: params.term,
            page: params.page
          };
        ,
        processResults: (data, params)->
          params.page = params.page || 1;

          return {
            results: data.items,
            pagination: {
              more: (params.page * 30) < data.total_count
            }
          };
      }
    })

  set_select2_ajax(field) for field in $('select.select2')
