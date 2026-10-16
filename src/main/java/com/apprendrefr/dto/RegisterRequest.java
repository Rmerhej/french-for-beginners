package com.apprendrefr.dto;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.Data;
/**
 * Données acceptées à l'inscription.
 *
 * Seuls ces champs peuvent être liés depuis le formulaire : l'identifiant,le rôle
 * et l'état du compte sont toujours décidés côté serveur.
 */
@Data
public class RegisterRequest {
    @NotBlank(message = "Le nom d'utilisateur est obligatoire")
    @Size(min = 3, max = 50, message = "Le nom d'utilisateur doit contenir entre 3 et 50 caractères")
    private String username;
    @NotBlank(message = "L'email est obligatoire")
    @Email(message = "L'adresse email n'est pas valide")

    @Size(max = 100)
    private String email;
    @NotBlank(message = "Le mot de passe est obligatoire")
    @Size(min = 8, max = 72, message = "Le mot de passe doit contenir entre 8 et 72 caractères")
    @Pattern(regexp = "^(?=.*[A-Za-z])(?=.*\\d).{8,}$", message = "Le mot de passe doit contenir au moins une lettre et un chiffre (8 caractères minimum)")
    private String password;
}