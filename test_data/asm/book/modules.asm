use my_module::Other as LocalOther;

// we can define a module at `./submodule.asm`
mod submodule;

// we can define a module at `./submodule_in_folder/mod.asm`
mod submodule_in_folder;

use submodule::Other as SubmoduleOther;
use submodule_in_folder::Other as FolderSubmoduleOther;

machine Main {
    // use a machine from another module by relative path
    my_module::Other a;
    
    // use a machine from another module using a local binding
    LocalOther b;

    // use a machine from another module defined in a different file
    SubmoduleOther c;

    // use a machine from another module defined in a different directory
    FolderSubmoduleOther c;

    reg pc[@pc];

    instr nothing = a.nothing
    instr also_nothing = b.nothing
    instr still_nothing = c.nothing

    function main {
        nothing;
        also_nothing;
        still_nothing;
        return;
    }
}

mod my_module {
    machine Other(latch, operation_id) {
        operation nothing<0>;

        constraints {
            col fixed latch = [1]*;
            col fixed operation_id = [0]*;
        }
    }
}