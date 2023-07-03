function eliminarProducto(id) {
    Swal.fire({
      title: '¿Desea eliminar esté producto?',
      icon: 'success',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Confirmar'
    }).then((result) => {
      if (result.isConfirmed) {
        Swal.fire('Eliminado!','Producto Eliminado Correctamente','success').then(function() {
            window.location.href = "/delete/"+id+"/";
        })
      }
    })
  }

function mensaje(titulo,texto,icono) {
Swal.fire({
    title: titulo,
    text: texto,
    icon: icono,
    showCancelButton: false,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    confirmButtonText: 'success'
})
}
function eliminarProductoCarrito(id) {
  Swal.fire({
    title: '¿Desea eliminar esté Producto del carrito?',
    icon: 'success',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    confirmButtonText: 'Confirmar'
  }).then((result) => {
    if (result.isConfirmed) {
      Swal.fire('Eliminado!','Empleado Eliminado Correctamente','success').then(function() {
          window.location.href = "/eliminar_del_carrito/"+id+"/";
      })
    }
  })
}