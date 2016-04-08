use common::sense;
use MyApp;
use Test::Mojo;
use Test::More;
use Test::Pretty;

my $t = Test::Mojo->new(MyApp->new);

subtest 'Test /json' => sub {

    subtest 'GET /json returns JSON data' => sub {
        $t->get_ok('/json')->status_is(200)->content_is('{"hello":"world"}')
            ->json_is({ hello => 'world' })->header_like('content-type' => qr|^application/json|i);
    };

    subtest 'POST /json returns 404' => sub {
        $t->post_ok('/json')->status_is(404);
    };
};

done_testing;
