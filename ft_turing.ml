open Arg
open Yojson.Basic

let process_machine jsonfile input =
  let json = Yojson.Basic.from_file jsonfile in

  Yojson.Basic.pretty_to_channel stdout json;
  print_newline ()


let main () =
  (* Command-line arguments setup *)
  let jsonfile = ref "" in
  let input = ref "" in

  (* Command-line options *)
  let speclist = [] in

  (* Usage message *)
  let usage_msg = "usage: ft_turing [-h] jsonfile input" in

  (* Parse the command-line arguments *)
  Arg.parse speclist (fun arg -> match !jsonfile with "" -> jsonfile := arg | _ -> input := arg) usage_msg;

  (* Check if both the JSON file and input are provided *)
  if !jsonfile = "" || !input = "" then begin
    Arg.usage speclist usage_msg;
    exit 1
  end;
  
  Printf.printf "JSON File: %s\n" !jsonfile;
  Printf.printf "Input: %s\n" !input;

  (* Process the Turing machine *)
  process_machine !jsonfile !input


let () = main ()
