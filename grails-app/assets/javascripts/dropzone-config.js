//= require common
//= require dropzone

Dropzone.options.uploadDocument = {
    paramName: "file", // The name that will be used to transfer the file
    maxFilesize: 10, // MB
    acceptedFiles: "application/pdf,.doc,.docx",
    init: function () {
        this.on("complete", function (file) {
            location.reload()
        });
    }
};