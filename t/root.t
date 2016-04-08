use common::sense;
use MyApp;
use Test::Mojo;
use Test::More;
use Test::Pretty;

my $t = Test::Mojo->new(MyApp->new);

subtest 'Test /' => sub {

    subtest 'GET / returns 200' => sub {
        $t->get_ok('/')->status_is(200)->content_like(qr|hello world|i);
    };

    subtest 'POST / returns 302' => sub {
        $t->post_ok('/')->status_is(302)->header_like(location => qr|\A/\z|);
    };
};

subtest 'Test /hoge' => sub {

    subtest 'GET /hoge returns 404' => sub {
        $t->get_ok('/hoge')->status_is(404);
    };
};

done_testing;
