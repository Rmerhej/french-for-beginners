package com.apprendrefr.exception;

import jakarta.servlet.http.HttpServletRequest;
import org.apache.catalina.connector.ClientAbortException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.ui.Model;
import org.springframework.validation.BindException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.sql.SQLException;

@ControllerAdvice
public class GlobalExceptionHandler {

    private static final Logger log =
            LoggerFactory.getLogger(GlobalExceptionHandler.class);

    // ========== 404 métier ==========
    @ExceptionHandler(ResourceNotFoundException.class)
    public String handleResourceNotFound(
            ResourceNotFoundException ex,
            Model model) {

        model.addAttribute("status", 404);
        model.addAttribute("errorMessage", ex.getMessage());

        return "error/404";
    }

    // ========== Erreurs métier ==========
    @ExceptionHandler(BusinessException.class)
    public String handleBusinessException(
            BusinessException ex,
            RedirectAttributes redirectAttributes) {

        redirectAttributes.addFlashAttribute("error", ex.getMessage());

        return "redirect:/";
    }

    // ========== Doublons spécifiques ==========
    @ExceptionHandler(DuplicateResourceException.class)
    public String handleDuplicate(
            DuplicateResourceException ex,
            RedirectAttributes redirectAttributes) {

        redirectAttributes.addFlashAttribute(
                "error",
                "❌ " + ex.getMessage()
        );

        return "redirect:/register";
    }

    // ========== Contraintes MySQL ==========
    @ExceptionHandler(DataIntegrityViolationException.class)
    public String handleDataIntegrity(
            DataIntegrityViolationException ex,
            RedirectAttributes redirectAttributes) {

        String message =
                "Violation de contrainte en base de données";

        Throwable rootCause = ex.getRootCause();

        if (rootCause instanceof SQLException sqlEx) {

            // Code MySQL 1062 = Duplicate entry
            if (sqlEx.getErrorCode() == 1062) {
                message =
                        "Cette valeur existe déjà " +
                                "(nom d'utilisateur ou email déjà utilisé)";
            }
        }

        redirectAttributes.addFlashAttribute(
                "error",
                "❌ " + message
        );

        return "redirect:/register";
    }

    // ========== Client qui abandonne la connexion ==========
    @ExceptionHandler(ClientAbortException.class)
    public void handleClientAbort(ClientAbortException ex) {

        // Ce n'est pas une véritable erreur applicative.
        // Le navigateur peut interrompre une requête audio
        // lorsqu'il effectue une nouvelle requête Range,
        // recharge la page ou quitte la page.

        log.debug(
                "Connexion client interrompue pendant l'envoi d'une ressource."
        );
    }

    // ========== Erreurs d'upload ==========
    @ExceptionHandler({FileUploadException.class, IOException.class})
    public String handleFileUpload(
            Exception ex,
            RedirectAttributes redirectAttributes) {

        log.error("Erreur upload fichier", ex);

        redirectAttributes.addFlashAttribute(
                "error",
                "❌ Erreur lors de l'upload du fichier"
        );

        return "redirect:/admin/dashboard";
    }

    // ========== Validation ==========
    @ExceptionHandler({
            MethodArgumentNotValidException.class,
            BindException.class
    })
    public String handleValidation(
            Exception ex,
            Model model) {

        model.addAttribute(
                "errorMessage",
                "Erreur de validation des données"
        );

        return "error/400";
    }

    // ========== Catch-all ==========
    @ExceptionHandler(Exception.class)
    public String handleAllExceptions(
            Exception ex,
            Model model,
            HttpServletRequest request) {

        log.error(
                "Erreur inattendue sur {} : {}",
                request.getRequestURI(),
                ex.getMessage(),
                ex
        );

        model.addAttribute("status", 500);

        model.addAttribute(
                "errorMessage",
                "Une erreur interne est survenue. " +
                        "Veuillez réessayer plus tard."
        );

        return "error/500";
    }
}
