; extends
(new_expression) @call.outer

(call_expression) @call.outer

(expression_statement
(assignment_expression
  left: (_) @assignment.lhs
  right: (_) @assignment.inner @assignment.rhs)) @assignment.outer

(lexical_declaration) @assignment.outer;
