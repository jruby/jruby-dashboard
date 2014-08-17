current = $jruby_parser.number_of_eval_parses
last = 0

SCHEDULER.every '1s' do
  send_event('evals', current: $jruby_parser.number_of_eval_parses)
  send_event('loads', current: $jruby_parser.number_of_load_parses)
end

