<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="<?= base_url('assets/img/Logo PMI.png'); ?>">

    <title><?= $title; ?> | Sistem Informasi Manajemen Logistik UTD </title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.0/examples/sign-in/">

    <!-- Bootstrap core CSS -->
    <link href="<?= base_url('assets/vendor/sign/bootstrap.min.css'); ?>" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<?= base_url('assets/vendor/sign/signin.css'); ?>" rel="stylesheet">
</head>

<body class="text-center">
    <form class="form-signin" method="post">
        <img class="mb-4" src="<?= base_url('assets/img/logo.jpeg'); ?>" alt="" width="100" height="85">

        <h1 class="h3 mb-3 font-weight-normal">Login</h1>

        <!-- pesan error -->
        <?php if ($this->session->flashdata('pesan')) : ?>
            <div class="alert alert-danger" role="alert">
                <?= $this->session->flashdata('pesan') ?>
            </div>
        <?php endif ?>

        <label for="inputEmail" class="sr-only">Email address</label>
        <input type="email" name="email" class="form-control" placeholder="Masukan Email">

        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" name="password" class="form-control" placeholder="Masukan Password">

        <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>

        <p class="mt-5 mb-3 text-darh"><b>Sistem Informasi Manajemen Logistik UTD </p>
    </form>

</body>

</html>