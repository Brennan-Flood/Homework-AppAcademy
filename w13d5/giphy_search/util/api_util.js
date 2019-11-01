export const fetchSearchGiphys = (searchTerm) => {
  return $.ajax({
    method: "GET",
    url: `http://api.giphy.com/v1/gifs/search?q=${searchTerm}&api_key=qt2ZSaBqdU7ypVm8VpAWvUdjEnxFkFDq&limit=2`,
    xhrFields: {
      withCredentials: true
    },
    crossDomain: true,
  })
}