// This module defines the Move code for an Ikigai choosing website.
module IkigaiChooser {

    // Define a struct to store a user's ikigai choices.
    struct IkigaiChoices {
        user: address;
        passion: string;
        mission: string;
        vocation: string;
        profession: string;
    }

    // Define a public function to store a user's ikigai choices.
    public fun store_ikigai_choices(ikigai_choices: IkigaiChoices) {
        // Check if the user has already chosen their ikigai.
        if (exists<IkigaiChoices>(ikigai_choices.user)) {
            abort("User has already chosen their ikigai.");
        }

        // Store the user's ikigai choices.
        set<IkigaiChoices>(ikigai_choices.user, ikigai_choices);
    }

    // Define a public function to retrieve a user's ikigai choices.
    public fun retrieve_ikigai_choices(user: address): IkigaiChoices? {
        // Check if the user has chosen their ikigai.
        if (!exists<IkigaiChoices>(user)) {
            return none();
        }

        // Retrieve the user's ikigai choices.
        return get<IkigaiChoices>(user);
    }
}
