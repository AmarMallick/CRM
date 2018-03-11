$.validator.setDefaults({
    submitHandler: function () {
        alert("submitted!");
    }
});

$().ready(function() {

});

$(document).ready(function () {
    var grid, dialog;

    dialog = $('#editForm').dialog({
        title: 'Add/Edit Record',
        autoOpen: false,
        resizable: false,
        modal: true
    });

    $(function () {
        $('#CreatedDate').datepicker({
            autoclose: true
        });
    });

    function Edit(e) {
        debugger;
        ResetFormandClearValidationErrors();
        $('#Id').val(e.data.record.Id);
        $('#Name').val(e.data.record.Name);
        $('#DisplayName').val(e.data.record.DisplayName);
        $('#ParentId').val(e.data.record.ParentId);
        $('#LinkUrl').val(e.data.record.LinkUrl);
        $('#ImageUrl').val(e.data.record.ImageUrl);
        $('#IsActive').prop('checked', e.data.record.IsActive);
        //$("#CreatedDate").datepicker("setDate", ToJavaScriptDate(e.data.record.CreatedDate));
        $('#DisplayOrder').val(e.data.record.DisplayOrder);
        $('#editForm').dialog('open');
    };

    grid = $('#grid').grid({
        dataSource: window.getMenus,
        dataKey: 'Id',
        uiLibrary: 'bootstrap',
        columns: [
            { field: 'Id', width: 50, hidden: true },
            { field: 'Name', title: 'Name', sortable: true },
            { field: 'DisplayName', title: 'Display Name' },
            { field: 'ParentId', title: 'PId', hidden: true },
            { field: 'ParentName', title: 'Parent' },
            { field: 'LinkUrl', title: 'Link', tmpl: '<a href="' + window.rootUrl + '{LinkUrl}" title="{LinkUrl}" target="_blank">{LinkUrl}</a>'},
            { field: 'ImageUrl', title: 'Image', tmpl: '<img src="' + window.rootUrl + '{ImageUrl}" title="{ImageUrl}" alt="{ImageUrl}" width="35" />', align: 'center' },
            { field: 'IsActive', title: 'IsActive', sortable: true, type: 'checkbox', align: 'center' },
            { field: 'CreatedDate', title: 'Added On', type: 'date', sortable: true },
            { field: 'DisplayOrder', title: 'Display Order', sortable: true },
            { title: '', field: 'Edit', width: 34, type: 'icon', icon: 'glyphicon-pencil', tooltip: 'Edit', events: { 'click': Edit } },
            { title: '', field: 'Delete', width: 34, type: 'icon', icon: 'glyphicon-remove', tooltip: 'Delete', events: { 'click': Remove } }
        ],
        pager: { enable: true, limit: 5, sizes: [2, 5, 10, 20] }
    });

    grid.on('cellDataBound', function (e, $wrapper, id, column, record) {
        if ('IsActive' === column.field) {
            $wrapper.find('input[type="checkbox"]').prop('checked', record.IsActive);
        }
    });

    function Add() {
        ResetFormandClearValidationErrors();
        $("#Id").val("");
        $("#Name").val("");
        $("#DisplayName").val("");
        $("#LinkUrl").val("");
        $("#ImageUrl").val("");
        $("#IsActive").val("");
        var currentDate = new Date();
        $("#CreatedDate").datepicker("setDate", currentDate);
        $('#editForm').dialog('open');
    };

    function ResetFormandClearValidationErrors() {
        $('input[type=reset]').click();
    }

    function Save() {
        debugger;
        var $form = this.closest('form');
        alert($form.find(".form-control input-validation-error").count());
        var menuObj = {
            Id: $("#Id").val(),
            Name: $("#Name").val(),
            DisplayName: $("#DisplayName").val(),
            ParentId: $("#ParentId").val(),
            ParentName: $("#ParentId").text(),
            LinkUrl: $("#LinkUrl").val(),
            ImageUrl: $("#ImageUrl").val(),
            IsActive: $("#IsActive").is(':checked'),
            CreatedDate: $("#CreatedDate").val()
        };
        $.ajax({
            url: window.saveMenu,
            type: "POST",
            data: { menuVm: menuObj }
        })
            .done(function () { grid.reload(); dialog.close(); })
            .fail(function () { alert("Unable to save."); })
    };

    function Remove(e) {
        confirm('Are you sure?', function () {
            $('#editForm').dialog('close');
        });
        $.ajax({ url: window.deleteMenu, type: 'POST', data: { id: e.data.record.Id } })
        .done(function () {
            grid.reload();
        })
        .fail(function () {
            alert("Unable to remove.");
        });
    };

function Search() {
    grid.reload({ searchString: $("#search").val() });
};

$("#btnAddMenu").on("click", Add);
//$("#btnSave").on("click", Save);
$("#btnCancel").on('click', dialog.cancel);
$("#btnSearch").on("click", Search);
});

function ToJavaScriptDate(value) { 
    //To Parse Date from the Returned Parsed Date 
    var pattern = /Date\(([^)]+)\)/;
    var results = pattern.exec(value);
    var dt = new Date(parseFloat(results[1]));
    return (dt.getMonth() + 1) + "/" + dt.getDate() + "/" + dt.getFullYear();
}
